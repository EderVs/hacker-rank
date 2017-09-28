{-
- Filter Elements
- https://www.hackerrank.com/challenges/filter-elements
-}

import Data.List

data PairOrd = POrd Int Int deriving Show

instance Eq PairOrd where
    (==) (POrd a b) (POrd a' b') = a == a'

instance Ord PairOrd where
    compare (POrd a _) (POrd a' _) = compare a a'
    (<) (POrd a _) (POrd a' _) = a < a'
    (<=) (POrd a _) (POrd a' _) = a <= a'
    (>) (POrd a _) (POrd a' _) = a > a'
    (>=) (POrd a _) (POrd a' _) = a >= a'

changePairOrd :: PairOrd -> PairOrd
changePairOrd (POrd a b) = (POrd b a)

filterNRepeatedElements' :: Eq a => [a] -> Int -> a -> Int -> [a] -> [a]
filterNRepeatedElements' [] n y c zs = if n <= c then (y:zs) else zs
filterNRepeatedElements' (x:xs) n y c zs
    | x == y = filterNRepeatedElements' xs n y (c+1) zs
    | n <= c = filterNRepeatedElements' xs n x 1 (y:zs)
    | otherwise = filterNRepeatedElements' xs n x 1 zs

toPairOrd :: [Int] -> Int -> [PairOrd] -> [PairOrd]
toPairOrd [] i ys = ys
toPairOrd (x:xs) i ys = (POrd x i):(toPairOrd xs (i+1) ys)

filterNRepeatedElements :: [Int] -> Int -> [Int]
filterNRepeatedElements xs n = result where
    (s:ss) = sort $ toPairOrd xs 0 []
    filter' = filterNRepeatedElements' ss n s 1 []
    result = map (\(POrd a b) -> b) $ sort $ map changePairOrd filter'

-- To Print --

filterNRepeatedElementsString :: [Int] -> Int -> String
filterNRepeatedElementsString xs n = if r == [] then "-1" else concatMap (\y -> y ++ " ") $ map show r where
    r = (filterNRepeatedElements xs n)

auxN :: String -> String
auxN xs = r where
    (_:r:[]) = words xs

getMultipleLines :: Int -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do          
        x <- getLine
        xs <- getLine
        ys <- getMultipleLines (n-1)    
        let ret = (filterNRepeatedElementsString (map read $ words xs :: [Int]) (read (auxN x) :: Int)):ys
        return ret

main :: IO()
main = do
    t <- getLine
    xs <- getMultipleLines (read t :: Int)
    putStrLn (intercalate "\n" xs)
