module Balanced.Parens where

-- import           Data.List

-- balancedParens3 :: Int -> [String]
-- balancedParens3 = nub . filter (m []) . permutations . concat . flip replicate "()"
--   where
--     m [] [] = True
--     m s       ('(':xs) = m ('(':s) xs
--     m ('(':s) (')':xs) = m s       xs
--     m _ _ = False
--
-- --
--
-- balancedParens2 :: Int -> [String]
-- balancedParens2 0 = [""]
-- balancedParens2 n = nub $ ["(" ++ str ++ ")" | str <- balancedParens2 (n-1)]
--   ++ [l ++ r | m <- [1..(n-1)], l <- balancedParens2 m, r <- balancedParens2 (n-m)]
--
--

{-

public class Parenthesis {
    static void brackets(int openStock, int closeStock, String s) {
        if (openStock == 0 && closeStock == 0) {
            System.out.println(s);
        }
        if (openStock > 0) {
            brackets(openStock-1, closeStock+1, s + "<");
        }
        if (closeStock > 0) {
            brackets(openStock, closeStock-1, s + ">");
        }
    }
    public static void main(String[] args) {
        brackets(3, 0, "");
    }
}

-}

balancedParens :: Int -> [String]
balancedParens = concat . bp [[]] 0

bp ss 0 0 = [ss]
bp ss l r = (if r > 0 then bp (map ((:) ')') ss) (l + 1) (r - 1) else [])
         ++ (if l > 0 then bp (map ((:) '(') ss) (l - 1) r       else [])
