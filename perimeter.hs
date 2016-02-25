module Codewars.Kata.Perimeter where

import           Data.List

perimeter :: Integer -> Integer
perimeter n = 4 * sum (genericTake (n + 1) fibs)

fibs :: [Integer]
fibs = 1 : 1 : zipWith (+) fibs (tail fibs)
