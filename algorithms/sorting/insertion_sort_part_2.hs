import System.IO
import Data.List

insert' :: [Int] -> Int -> Int -> Int -> [Int]
insert' [] _ _ _ = []
insert' xs xsn n y =
	if (xsn) == n then
		xs++[y]
	else if (y) <= (xs!!(n)) then
		(take n xs) ++ [y] ++ (drop n xs)
	else
		insert' xs xsn (n+1) y

insertionSort :: [Int] -> Int -> Int -> [[Int]]
insertionSort xs xsn n =
	if (xsn-1) == n then
		[sorted_list]
	else
		new_list:insertionSort new_list (xsn) (n+1)
	where
		sorted_list = insert' (take n xs) (n) 0 (xs!!n)
		new_list = ((sorted_list)++(drop (n+1) xs))

intListToStr :: [[Int]] -> String
intListToStr [] = ""
intListToStr (xs:xss) = unwords (map (show) xs) ++ "\n" ++ intListToStr xss

main :: IO()
main = do
	xsn <- getLine
	xs_s <- getLine
	let xs = map (\x -> read x :: Int) (words xs_s)
	putStrLn (intListToStr (insertionSort xs (read xsn :: Int) 1))