module IPv4 where

import           Data.Bits
import           Data.Int  (Int32)

type IPString = String

int32ToIP :: Int32 -> IPString
int32ToIP int32 = show (int32 .&. (bit 255 `shiftL` 24))
