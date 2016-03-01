-- least common multiple of a list
module LeastCommonMultiple where

import           Prelude hiding (lcm)

lcm :: Integral a => [a] -> a
lcm = foldl1 myLCM

myLCM :: Integral a => a -> a -> a
myLCM a b | a == 0 || b == 0 = 0
          | otherwise = a * b `div` gcd a b

main :: IO ()
main = print $ lcm [1..10]
