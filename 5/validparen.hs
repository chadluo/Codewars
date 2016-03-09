module Codewars.Parentheses where

validParentheses :: String -> Bool
validParentheses = v []

v :: String -> String -> Bool
v [] [] = True
v s ('(':xs) = v ('(':s) xs
v ('(':s) (')':xs) = v s xs
v _ _ = False
