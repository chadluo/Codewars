module HumanTime where

humanReadable :: Int -> String
humanReadable x = show' h ++ ":" ++ show' m ++ ":" ++ show' s where
  (mm, s) = divMod x 60
  (h, m)  = divMod mm 60
  show' x = if x < 10 then '0' : show x else show x
