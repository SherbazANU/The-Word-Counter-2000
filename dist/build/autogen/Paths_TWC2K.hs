{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_TWC2K (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/sherbaz/Library/Haskell/bin"
libdir     = "/Users/sherbaz/Library/Haskell/ghc-8.0.2-x86_64/lib/TWC2K-0.1.0.0"
dynlibdir  = "/Users/sherbaz/Library/Haskell/ghc-8.0.2-x86_64/lib/x86_64-osx-ghc-8.0.2"
datadir    = "/Users/sherbaz/Library/Haskell/share/ghc-8.0.2-x86_64/TWC2K-0.1.0.0"
libexecdir = "/Users/sherbaz/Library/Haskell/libexec"
sysconfdir = "/Users/sherbaz/Library/Haskell/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "TWC2K_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "TWC2K_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "TWC2K_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "TWC2K_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "TWC2K_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "TWC2K_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
