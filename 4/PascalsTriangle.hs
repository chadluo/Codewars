module Codewars.Kata.PascalsTriangle where

pascalsTriangle :: Int -> [Int]
pascalsTriangle = map fromIntegral . concatMap p . enumFromTo 0 . fromIntegral . pred where
  p n = map (choose n) [0..n]
  choose n k = product [(k + 1)..n] `div` factorial (n - k)
  factorial = product . enumFromTo 1
