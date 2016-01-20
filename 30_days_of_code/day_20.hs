import System.IO
import Data.List
import Data.Char 

inList :: Ord a => a -> [a] -> Bool
inList _ [] = False
inList y (x:xs)
	| x == y = True
	| otherwise = inList y xs

nextPlace :: String -> Int -> Int
nextPlace [] n = -1
nextPlace (x:xs) n
	| inList x ['_',' ',(chr 39),'@','!','[','?','.',(chr 92),'+',']',','] = n
	| otherwise = nextPlace xs (n+1)

words' :: String -> [String]
words' [] = []
words' xs = if next_place == -1 then
		[(take (length xs) xs)] 
	else if next_place == 0 then
		words' (drop (next_place + 1) xs)
	else
		(take next_place xs):words' (drop (next_place + 1) xs)
	where
		next_place = nextPlace xs 0

main :: IO()
main = do
	text <- getLine
	let text' = show text
	putStrLn (show (length (words' text)))
	putStrLn (intercalate "\n" (words' text))