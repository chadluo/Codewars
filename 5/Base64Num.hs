module Codewars.Kata.Base64 (base64ToBase10) where

base64ToBase10 :: String -> Integer
base64ToBase10 = foldl (\i c -> i * 64 + d c) 0 where
  d c = head [snd p | p <- t, fst p == c]
  t = zip (['A'..'Z'] ++ ['a'..'z'] ++ ['0'..'9'] ++ "+/") [0..63]
