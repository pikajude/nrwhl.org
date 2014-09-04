{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}

module Data.Bitmask (
    mkBitmask, mkBitmaskOpts,

    BitmaskOpts (..), def
) where

#if defined(__GLASGOW_HASKELL__) && __GLASGOW_HASKELL__ <= 706
#define FiniteBits Bits
#endif

import Control.Monad
import Data.Bits (FiniteBits, setBit, testBit, clearBit, bit)
import Data.Char
import Data.Default
import Data.Maybe
import Language.Haskell.TH
import Language.Haskell.TH.Syntax
import Prelude

data BitmaskOpts = BitmaskOpts
                 { convertToName :: Maybe String
                 , convertFromName :: Maybe String
                 }

instance Default BitmaskOpts where
    def = BitmaskOpts def def

mkBitmask :: Name -> Q [Dec]
mkBitmask = mkBitmaskOpts def

mkBitmaskOpts :: BitmaskOpts -> Name -> Q [Dec]
mkBitmaskOpts opts name = do
    tycon <- reify name
    case tycon of
        TyConI (DataD _ n [] [con] _) -> genBitmask opts n con
        TyConI (DataD _ _ (_ : _) _ _) ->
            error "Bitmasked types cannot take type arguments."
        TyConI (DataD _ (Name (OccName s) _) _ cs _) ->
            error $ "Expected an ADT with one constructor, but `" ++ s
                 ++ "' has " ++ show (length cs) ++ "."
        _ -> error "Expected a type constructor, but wasn't passed one."

genBitmask :: BitmaskOpts -> Name -> Con -> Q [Dec]
genBitmask opts name constructor = do
    let conString = unName name
        isBool = allBool constructor
    unless isBool $
        error $ "Constructor `" ++ conString ++ "' has a non-Bool argument."
    let toName = mkName $ fromMaybe (decapitalize conString ++ "ToBits")
                     (convertToName opts)
        fromName = mkName $ fromMaybe ("bitsTo" ++ conString) (convertFromName opts)
        (conName, conArity) = argumentInfo constructor
    conArgs <- replicateM conArity (newName "x")
    let vals = zipWith (\ a x -> [| if $(varE x)
                                        then (`setBit` $(litE (integerL a)))
                                        else id |]) [0 ..] conArgs
        setter = foldl (\ a b -> [| $(a) . $(b) |]) [| id |] vals
    toDec <- funD toName
        [clause
            [conP conName (map varP conArgs)]
            (normalB [| $(setter) (clearBit (bit 0) 0) |])
            []]

    i <- newName "i"
    let exprs = map (\ a -> [| testBit $(varE i) $(litE (integerL a)) |])
                    (take (length conArgs) [0 ..])
    fromDec <- funD fromName
        [clause
            [varP i]
            (normalB (foldl appE (conE conName) exprs))
            []]

#ifndef HLINT
    toSig <- [t|FiniteBits a => $(conT name) -> a|]
    fromSig <- [t|FiniteBits a => a -> $(conT name)|]
#endif

    return [SigD toName toSig, toDec, SigD fromName fromSig, fromDec]
    where
        unName (Name (OccName n) _) = n

allBool :: Con -> Bool
allBool (NormalC _ st) = all ((== boolTypeName) . snd) st
allBool (RecC _ st) = all (\ (_, _, c) -> c == boolTypeName) st
allBool (InfixC (_, a) _ (_, b)) = a == boolTypeName && b == boolTypeName
allBool (ForallC _ _ con) = allBool con

boolTypeName :: Type
boolTypeName = ConT ''Bool

argumentInfo :: Con -> (Name, Int)
argumentInfo (NormalC n st) = (n, length st)
argumentInfo (RecC n st) = (n, length st)
argumentInfo (InfixC _ n _) = (n, 2)
argumentInfo (ForallC _ _ c) = argumentInfo c

decapitalize :: String -> String
decapitalize (s : ss) = toLower s : ss
decapitalize [] = error "decapitalize: empty string"
