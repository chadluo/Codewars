module Codewars.Kata.Group10 where

import           Data.List

groupIn10s :: [Int] -> [[Int]]
groupIn10s  = reverse . dropWhile (== []) . reverse . map tail . groupBy (\x y -> x `div` 10 == y `div` 10) . sort . (++ [0,10..100])
