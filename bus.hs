module Codewars.Kata.Bus where

number :: [(Int, Int)] -> Int
number [] = 0
number xs = up - down where
  (up, down) = foldl1 (\(a, b) (c, d) -> (a+c, b+d)) xs
