import System.IO

mergeLists :: Eq a => [a] -> [a] -> [a]
mergeLists [] [] = []
mergeLists (x:xs) (y:ys) = x:y:mergeLists xs ys

main :: IO()
main = do
	xs <- getLine
	ys <- getLine
	putStrLn (mergeLists xs ys)