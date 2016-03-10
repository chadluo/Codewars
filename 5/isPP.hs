module Codewars.Kata.PP (isPP) where

isPP :: Integer -> Maybe (Integer, Integer)
isPP i = satisfy i solutions where
  solutions = [(m,k) | m <- [2..(ceiling . sqrt) (i' :: Double)],
                       k <- [2..(ceiling . logBase 2) (i' :: Double)]]
  i' = fromIntegral i

satisfy :: Integer -> [(Integer, Integer)] -> Maybe (Integer, Integer)
satisfy _ [] = Nothing
satisfy i ((m,k):ps) | m ^ k == i = Just (m,k)
                     | otherwise  = satisfy i ps
