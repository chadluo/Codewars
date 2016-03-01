module Codewars.Kata.Braces where

validBraces :: String -> Bool
validBraces = v []

v :: String -> String -> Bool
v [] [] = True
v s ('(':xs) = v ('(':s) xs
v s ('[':xs) = v ('[':s) xs
v s ('{':xs) = v ('{':s) xs
v ('(':s) (')':xs) = v s xs
v ('[':s) (']':xs) = v s xs
v ('{':s) ('}':xs) = v s xs
v _ _ = False
