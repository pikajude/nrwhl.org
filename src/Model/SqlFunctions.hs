module Model.SqlFunctions where

import Database.Esqueleto
import Database.Esqueleto.Internal.Sql
import Types.User

lower, unaccent :: SqlExpr (Value Username) -> SqlExpr (Value Username)

lower = unsafeSqlFunction "LOWER"
unaccent = unsafeSqlFunction "UNACCENT"
