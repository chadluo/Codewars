-- Codewars does not support list-4.8.0.0 so cannot use `isSubsequenceOf`.
-- This is only for reference.

module Pangram where

import           Data.Char (toLower)
import           Data.List (isSubsequenceOf, sort)

isPangram :: String -> Bool
isPangram = (['a'..'z'] `isSubsequenceOf`) . sort . map toLower
