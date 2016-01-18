import System.IO
import Data.List

doMerge :: [Int] -> [Int] -> [Int]
doMerge xs [] = xs
doMerge [] ys = ys
doMerge (x:xs) (y:ys) 
	| x > y = y:doMerge (x:xs) ys
	| otherwise = x:doMerge xs (y:ys)

mergeSort :: [Int] -> [Int]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort xs = doMerge left right where
	left = mergeSort (take ((length xs) `div` 2) xs)
	right = mergeSort (drop ((length xs) `div` 2) xs)

getMinimunDifference :: [Int] -> (Int, [Int])
getMinimunDifference (x:y:[]) = (abs(x - y), [x, y])
getMinimunDifference (x:y:xs) =
	if now < later_min then
		(now, [x, y])
	else if now > later_min then
		(later_min, later)
	else
		(later_min, x:y:later)
	where
		(later_min, later) = getMinimunDifference (y:xs)
		now = abs (x - y)

main :: IO()
main = do
	_ <- getLine
	nums <- getLine
	putStrLn (unwords (map (show) (snd (getMinimunDifference (mergeSort (map (\x -> read x :: Int) (words nums)))))))