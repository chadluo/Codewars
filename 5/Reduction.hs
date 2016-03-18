module Codewars.Kata.Reduction where
-- import Codewars.Kata.Reduction.Direction

data Direction = North | East | West | South deriving (Eq, Show)

dirReduce :: [Direction] -> [Direction]
dirReduce = red []

red :: [Direction] -> [Direction] -> [Direction]
red s [] = reverse s
red (North:ss) (South:ds) = red ss ds
red (South:ss) (North:ds) = red ss ds
red (West:ss) (East:ds) = red ss ds
red (East:ss) (West:ds) = red ss ds
red s (x:xs) = red (x:s) xs
