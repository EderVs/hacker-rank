import System.IO

removeDuplicates' :: Eq a => [a] -> [a] -> [a]
removeDuplicates' [] _ = []
removeDuplicates' (x:xs) ys
	| elem x ys = removeDuplicates' xs ys
	| otherwise = x:removeDuplicates' xs (x:ys)

removeDuplicates :: Eq a => [a] -> [a]
removeDuplicates xs = removeDuplicates' xs []

main :: IO()
main = do
	text <- getLine
	putStrLn (removeDuplicates text)