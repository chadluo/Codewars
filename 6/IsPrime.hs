module IsPrime where

isPrime :: Integer -> Bool
isPrime 0 = False
isPrime 1 = False
isPrime x = all ((/= 0) . mod x) $ primes (x `div` 2)

primes x = sieve [2..x] where
  sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p /= 0]
  sieve [] = []
