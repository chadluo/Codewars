module LazyNext where

next :: Eq a => a -> [a] -> Maybe a
next item xs = next' item xs' where xs' = pairs xs

next' :: Eq a => a -> [(a,a)] -> Maybe a
next' _ [] = Nothing
next' item (x:xs) = if item == fst x then Just (snd x) else next' item xs

pairs :: [a]->[(a,a)]
pairs xs = zip xs $ tail xs
