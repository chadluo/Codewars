module Codewars.Numbers where

abundantNumber :: Int -> Bool
abundantNumber ns = ns < sum [n | n <- [1..ns `div` 2], ns `rem` n == 0]
