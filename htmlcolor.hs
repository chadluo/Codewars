module Codewars.Kata.HTMLComplementaryColor (getReversedColor) where

import           Data.Char
import           Numeric

getReversedColor :: String -> Maybe String
getReversedColor x = filterLength x >>= filterHexFigure >>= getComplement

-- Reject long inputs, fill short inputs
filterLength :: String -> Maybe String
filterLength x | length x > 6 = Nothing
               | otherwise    = Just $ replicate (6 - length x) '0' ++ x

-- Accept Hex figures
filterHexFigure :: String -> Maybe String
filterHexFigure x | any (not . isHexDigit . toUpper) x = Nothing
                  | otherwise = Just x

getComplement :: String -> Maybe String
getComplement x = return $ '#' : (concatMap rev . prism) x

prism :: [a] -> [[a]]
prism x = [take 2 x, slice 2 2 x, slice 4 2 x] where
  slice offset len = take len . drop offset

rev :: String -> String
rev x = let ((d, _):_) = readHex x
        in (if d > 239 then "0" else "") ++
         (map toUpper $ showHex (255 - d :: Int) "")
