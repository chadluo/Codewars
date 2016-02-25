module Codewars.Numbers where

twoCount :: Int -> Int
twoCount x = twoCount' x 0

twoCount' :: Int -> Int -> Int
twoCount' n c | even n    = twoCount' (n `div` 2) (succ c)
              | otherwise = c
