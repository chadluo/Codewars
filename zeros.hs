module Zeros where

{-
int findTrailingZeros(int  n)
{
    // Initialize result
    int count = 0;

    // Keep dividing n by powers of 5 and update count
    for (int i=5; n/i>=1; i *= 5)
          count += n/i;

    return count;
}
-}

zeros :: Int -> Int
zeros x = sum $ map (div x) $ takeWhile (<= x) $ iterate (*5) 5

-- zeros' :: Int -> Int -> Int
-- zeros' m x | m > x = 0
          --  | otherwise = div x m + zeros' (5 * m) x
