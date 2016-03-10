module CamelCase(toCamelCase) where

import           Data.Char (toUpper)

toCamelCase :: String -> String
toCamelCase [] = []
toCamelCase ('-':'-':xs) = toCamelCase ('-':xs)
toCamelCase ('_':'_':xs) = toCamelCase ('_':xs)
toCamelCase ('-':x:xs) = (toUpper x):toCamelCase xs
toCamelCase ('_':x:xs) = (toUpper x):toCamelCase xs
toCamelCase ('-':xs) = toCamelCase xs
toCamelCase ('_':xs) = toCamelCase xs
toCamelCase (x:xs) = x:toCamelCase xs
