module Balanced.Parens where

import           Data.List

balancedParens :: Int -> [String]
balancedParens 0 = [""]
balancedParens n = nub $ ["(" ++ str ++ ")" | str <- balancedParens (n-1)]
  ++ [l ++ r | m <- [1..(n-1)], l <- balancedParens m, r <- balancedParens (n-m)]
