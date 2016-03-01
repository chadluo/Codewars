module Codewars.G964.Rentalcarcost where

rentalCarCost :: Int -> Int
rentalCarCost d = 40 * d - discount d where
  discount x | x >= 7 = 50
             | x >= 3 = 20
             | otherwise = 0
