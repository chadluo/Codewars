module IsPrime where

isPrime :: Integer -> Bool
isPrime 0 = False
isPrime 1 = False
isPrime 2 = True
isPrime x | x < 0     = isPrime (- x)
          | otherwise = myall ((/= 0) . mod x) $ 2:[3,5..x `div` 2]

myall :: (a -> Bool) -> [a] -> Bool
myall _ [] = True
myall f (x:xs) = if f x then myall f xs else False
