module Codewars.Strings where

import           Data.Char

doubleCheck :: String -> Bool
doubleCheck x = or $ zipWith (==) x' (tail x') where
  x' = map toLower x
