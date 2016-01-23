import System.IO

getIndex' :: Eq a => a -> [a] -> Int
getIndex' _ [] = 1
getIndex' y (x:xs)
	| y == x = 0
	| otherwise = 1 + getIndex' y xs

getIndex :: Eq a => a -> [a] -> Int
getIndex x ys =
	if index >= length ys then
		-1
	else
		index
	where
		index = getIndex' x ys

main :: IO()
main = do
	x <- getLine
	_ <- getLine
	ys <- getLine
	putStrLn (show (getIndex (read x :: Int) (map (\z -> read z :: Int) (words ys))))