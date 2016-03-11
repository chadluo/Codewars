module Codewars.G964.Gps1 where

gps :: Int -> [Double] -> Int
gps s x | length x `elem` [0,1] = 0
        | otherwise = floor $ maximum $ map ((*3600) . (/ fromIntegral s)) $ zipWith (-) (tail x) x
