module Fibonacci where

-- import           Data.List

fib :: Integer -> Integer
fib n = round $ phi ** fromIntegral n / sq5 where
    sq5 = sqrt 5 :: Double
    phi = (1 + sq5) / 2

{-}
fibNeg :: [Integer]
fibNeg = 0:1:zipWith (-) fibNeg (tail fibNeg)

fibPos :: [Integer]
fibPos = 0:1:zipWith (+) fibPos (tail fibPos)
-}
