module Codewars.Kata.PrFactors where

import           Control.Arrow ((&&&))
import           Data.List     (group, (\\))

prime_factors :: Integer -> String
prime_factors n = p'' $ map (head &&& length) ((group . factorise) n)

p'' :: [(Integer, Int)] -> String
p'' = foldl f "" where
  f str (base, power) = str ++ "(" ++ show base ++
   (if power == 1 then "" else "**" ++ show power) ++ ")"

factorise :: Integer -> [Integer]
factorise n = t ([2..(n `div` 2)]++ [n]) n

-- primes m = sieve [2..m] where
--   sieve (x:xs) = x : sieve (xs \\ [x,x+x..m])
--   sieve [] = []

t :: [Integer] -> Integer -> [Integer]
t [] _ = []
t _ 1  = []
t ps n = if r == 0 then h : t ps q else t (tail ps) n where
  h = head ps
  (q, r) = divMod n h
