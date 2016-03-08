module Snail where

snail :: [[Int]] -> [Int]
snail [] = []
snail [[]] = []
snail [[x]] = [x]
snail [[a,b],[c,d]] = [a,b,d,c]
snail x = up ++ right ++ bottom ++ left ++ snail rest where
  up = head x
  right = (map last . tail) x
  bottom = (tail . reverse . last) x
  left = (tail . reverse . tail . map head) x
  rest = (map tail . map init . tail . init) x

array :: [[Int]]
array = [[1,2,3], [4,5,6], [7,8,9]]

array2 :: [[Int]]
array2 = [[1,2,3,1],[4,5,6,4],[7,8,9,7],[7,8,9,7]]
