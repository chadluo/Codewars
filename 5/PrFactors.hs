module Codewars.Kata.PrFactors (prime_factors) where

import           Control.Arrow ((&&&))
import           Data.List     (group, (\\))

prime_factors :: Integer -> String
prime_factors = printFac . map (head &&& length) . group . factorise

factorise :: Integer -> [Integer]
factorise n = t (2 : ([3, 5 .. (div n 2)] ++ [n])) n;

t :: [Integer] -> Integer -> [Integer]
t [] _ = []
t _ 1  = []
t ps n = if r == 0 then h : t ps q else t (tail ps) n where
  h = head ps
  (q, r) = divMod n h

printFac :: [(Integer, Int)] -> String
printFac = foldl f "" where
  f str (base, power) = str ++ "(" ++ show base ++
   (if power == 1 then "" else "**" ++ show power) ++ ")"
