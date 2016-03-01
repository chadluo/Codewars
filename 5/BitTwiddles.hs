module BitTwiddles where

import           Data.Bits hiding (popCount)
import           Data.Int  (Int32)
import           Prelude   hiding (Ordering (..), abs, compare, div, divMod,
                            even, fromInteger, fromIntegral, mod, odd, quot,
                            quotRem, rem, (&&), (*), (/), (<), (>), (^), (||))

isEven :: Bits a => a -> Bool
isEven = not . isOdd

isOdd  :: Bits a => a -> Bool
isOdd = flip testBit 0

halfAndFloor  :: Bits a => a -> a
halfAndFloor = flip shiftR 1

isPowerOfTwo :: (Num a, Bits a) => a -> Bool
isPowerOfTwo x = 1 == sum (map (\m -> if testBit x m then (1::Int) else 0) [0..31])

nthPowerOfTwo :: (Num a, Bits a) => Int -> a
nthPowerOfTwo = shiftL (bit 1) . pred

abs :: Int32 -> Int32
abs x | x >= 0 = x
      | otherwise = complement x + 1
