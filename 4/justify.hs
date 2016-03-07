module TextAlignJustify where

import           Data.List

justify :: String -> Int -> String
justify text width = init $ unlines $ c width (words text) [] []

c :: Int -> [String] -> [String] -> [String] -> [String]
c w []     tmp os = os ++ [unwords tmp]
c w (t:ts) tmp os
  | 1 + length t + l' tmp <= w = c w ts (tmp ++ [t]) os
  | otherwise                  = c w (t:ts) [] (os ++ [unwords' (w - l'' tmp) tmp])

l' xs = length xs + (sum . map length) xs - 1
l'' = (sum . map length)

unwords' :: Int -> [String] -> String
unwords' _ [x] = x
unwords' width (t:ts) = t ++ (replicate x ' ') ++ unwords' (width - x) ts where
  x = width `div` l + if width `mod` l == 0 then 0 else 1
  l = length ts

--

sample :: String
sample = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis dolor mauris, at elementum ligula tempor eget. In quis rhoncus nunc, at aliquet orci. Fusce at dolor sit amet felis suscipit tristique. Nam a imperdiet tellus. Nulla eu vestibulum urna. Vivamus tincidunt suscipit enim, nec ultrices nisi volutpat ac. Maecenas sit amet lacinia arcu, non dictum justo. Donec sed quam vel risus faucibus euismod. Suspendisse rhoncus rhoncus felis at fermentum. Donec lorem magna, ultricies a nunc sit amet, blandit fringilla nunc. In vestibulum velit ac felis rhoncus pellentesque. Mauris at tellus enim. Aliquam eleifend tempus dapibus. Pellentesque commodo, nisi sit amet hendrerit fringilla, ante odio porta lacus, ut elementum justo nulla et dolor."

test0 = putStrLn $ justify "123 45 6" 7
test  = putStrLn $ justify sample 30
test2 = putStrLn $ justify sample 80
