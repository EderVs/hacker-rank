import System.IO

insertFirst :: [Int] -> Int -> Int -> Int -> [[Int]]
insertFirst xs xsn n y =
	if (xsn - 1) == n then
		[(take n xs)++[y]]
	else if y > (xs!!(n+1)) then
		[(take n xs)++[y]++(drop (n+1) xs)]
	else
		new_list:insertFirst new_list xsn (n+1) y
	where 
		new_list = (take n xs)++[(xs!!(n+1))]++(drop (n+1) xs)

intListToStr :: [[Int]] -> String
intListToStr [] = ""
intListToStr (xs:xss) = unwords (reverse (map (show) xs)) ++ "\n" ++ intListToStr xss

main :: IO()
main = do
	xsn <- getLine
	xs_s <- getLine
	let xs = map (\x -> read x :: Int) (words xs_s)
	putStrLn (intListToStr (insertFirst (reverse xs) (read xsn :: Int) 0 (last xs)))