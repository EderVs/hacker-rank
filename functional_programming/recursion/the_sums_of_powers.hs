{-
- The sums of powers
- Find the number of ways that a given integer, X, can be expressed as the sum of the
- Nth power of unique, natural numbers.
-}


aux :: Int -> Int -> Int -> Int -> Int
aux _ _ 0 _ = 0
aux x n i c =
    (if actualSum == x then 1 else 0) +
    (if actualSum >= x then 0 else aux x n (i-1) (actualSum)) + (aux x n (i-1) (c)) where
        actualSum = c + i^n

intNroot' :: Int -> Int -> Int -> Int -> Int
intNroot' n x i p = if i ^ n <= x then intNroot' n x (i+1) i else p

intNroot :: Int -> Int -> Int
intNroot n x = intNroot' n x 0 0

sumsOfPowers :: Int -> Int -> Int
sumsOfPowers x n = aux x n (intNroot n x) 0

main :: IO()
main = do
    x <- getLine
    n <- getLine
    putStrLn (show (sumsOfPowers (read x :: Int) (read n :: Int)))
