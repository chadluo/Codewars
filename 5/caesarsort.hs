module CaesarSort where

import           Data.Char
import           Data.List

caesarSort :: [String] -> [[String]]
caesarSort [] = []
caesarSort (x:xs) = (x : sameGroup) : caesarSort notGroup where
  (sameGroup, notGroup) = partition (caesarEq x) xs

caesarEq :: String -> String -> Bool
caesarEq str1 str2 = length str1 == length str2 && str1 == caesar diff str2
  where
    diff = ord (head str1) - ord (head str2)

caesar :: Int -> String -> String
caesar x str | x == 0    = str
             | x < 0     = caesar (x + 1) $ map pred' str
             | otherwise = caesar (x - 1) $ map succ' str

pred' :: Char -> Char
pred' 'a' = 'z'
pred' c = pred c

succ' :: Char -> Char
succ' 'z' = 'a'
succ' c = succ c
