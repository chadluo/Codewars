module Codewars.Kata.PrFactors (prime_factors) where

import           Control.Arrow ((&&&))
import           Data.List     (group, (\\))

prime_factors :: Integer -> String
prime_factors = printFac . map (head &&& length) . group . factor

-- https://wiki.haskell.org/99_questions/Solutions/35
factor 1 = []
factor n = let divisors = dropWhile ((/= 0) . mod n) [2 .. ceiling $ sqrt $ fromIntegral n]
           in let prime = if null divisors then n else head divisors
              in (prime :) $ factor $ div n prime

printFac :: [(Integer, Int)] -> String
printFac = foldl f "" where
  f str (base, power) = str ++ "(" ++ show base ++
   (if power == 1 then "" else "**" ++ show power) ++ ")"
