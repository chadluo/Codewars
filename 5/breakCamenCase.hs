module Codewars.Kata.BreakCamelCase where

import           Data.Char

solution :: String -> String
solution = dropWhile isSpace . solution'

solution' :: String -> String
solution' [] = []
solution' (x:xs) | isUpper x = ' ' : x : solution' xs
                | otherwise = x : solution' xs

main :: IO ()
main = print $ solution "helloWorld"
