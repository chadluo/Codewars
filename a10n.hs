module A9n where

import           Data.Char (isAlpha)
import           Data.List (intersperse)

abbreviate :: String -> String
abbreviate = concat . (intersperse "-") . map abbr . mywords

abbr :: String -> String
abbr str | length str < 4 || any (not . isAlpha) str = str
         | otherwise = [head str] ++ show (length str - 2) ++ [last str]

mywords :: String -> [String]
mywords [] = []
mywords ('-':str) = mywords str
mywords str = [x] ++ mywords xs where
  (x,xs) = break (== '-') str

sentense  = "Four score and seven years ago"
sentense2 = "Four-score-and-seven-years-ago"
