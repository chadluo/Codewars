module Codewars.G964.Getmiddle where

getMiddle :: String -> String
getMiddle s | length s < 3 = s
            | otherwise    = (getMiddle . tail . init) s
