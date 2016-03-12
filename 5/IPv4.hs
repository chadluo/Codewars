module IPv4 (int32ToIP) where

import           Data.Bits (bit, rotateR, (.&.), (.|.))
import           Data.List (intersperse)
-- import           Data.Word (Word32)
import           Data.Int  (Int32)

type IPString = String

int32ToIP :: Int32 -> IPString
int32ToIP w = concat $ intersperse "." $ map (\(b,o) -> show $ (w .&. b) `rotateR` o) octets

octets :: [(Int32, Int)]
octets = [(bin [n..(n+7)], n) | n <- [24,16..0]]

bin :: [Int] -> Int32
bin = foldl1 (.|.) . map bit

----

test :: IPString
test = int32ToIP 2149583361
