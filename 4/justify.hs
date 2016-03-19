module TextAlignJustify where

justify :: String -> Int -> String
justify text width = (init . unlines . spacify width . linify width . words) text

linify :: Int -> [String] -> [[String]]
linify w = l w [] where
  l _ t []     = [t]
  l w t (x:xs) | (length . unwords) (x:t) <= w = l w (t ++ [x]) xs
               | otherwise                     = t : l w [] (x:xs)

spacify :: Int -> [[String]] -> [String]
spacify _ [x]    = [unwords x]
spacify w (x:xs) = unwords' l x : spacify w xs where
  l = w - (sum . map length) x
  unwords' _ [y]    = y
  unwords' w (y:ys) = y ++ replicate m ' ' ++ unwords' (w - m) ys where
    m = w `div` l' + if w `mod` l' == 0 then 0 else 1
    l' = length ys

test  = putStrLn $ justify "123 45 6" 7
test1 = putStrLn $ justify sample 30
test2 = putStrLn $ justify sample 80

sample :: String
sample = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum \
\sagittis dolor mauris, at elementum ligula tempor eget. In quis rhoncus nunc, \
\at aliquet orci. Fusce at dolor sit amet felis suscipit tristique. Nam a \
\imperdiet tellus. Nulla eu vestibulum urna. Vivamus tincidunt suscipit enim, \
\nec ultrices nisi volutpat ac. Maecenas sit amet lacinia arcu, non dictum \
\justo. Donec sed quam vel risus faucibus euismod. Suspendisse rhoncus rhoncus \
\felis at fermentum. Donec lorem magna, ultricies a nunc sit amet, blandit \
\fringilla nunc. In vestibulum velit ac felis rhoncus pellentesque. Mauris at \
\tellus enim. Aliquam eleifend tempus dapibus. Pellentesque commodo, nisi sit \
\amet hendrerit fringilla, ante odio porta lacus, ut elementum justo nulla et \
\dolor."
