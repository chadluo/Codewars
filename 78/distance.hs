module Codewars.Kata.Distance where

distancesFromAverage :: [Double] -> [Double]
distancesFromAverage xs = map (avg-) xs where
  avg = sum xs / fromIntegral (length xs)
