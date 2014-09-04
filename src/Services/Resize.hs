module Services.Resize where

import Control.Monad.IO.Class
import Data.ByteString
import Graphics.ImageMagick.MagickWand
import Prelude

resizeTo :: MonadIO m => (Int, Int) -> ByteString -> m ByteString
resizeTo (width, height) blob = liftIO . withMagickWandGenesis $ do
    (_, w) <- magickWand

    readImageBlob w blob
    resizeImage w width height lanczosFilter 1
    getImageBlob w
