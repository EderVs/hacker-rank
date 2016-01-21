import System.IO
import Data.List

inList :: Ord a => a -> [a] -> Bool
inList _ [] = False
inList y (x:xs)
	| x == y = True
	| otherwise = inList y xs

minToAnagram :: String -> String -> Int
minToAnagram [] _ = 0
minToAnagram (x:xs) ys =
	if inList x ys then
		minToAnagram xs (delete x ys)
	else
		1 + minToAnagram xs ys

isPosibleAnagram :: String -> Int
isPosibleAnagram [] = 0
isPosibleAnagram text
	| (length text) `mod` 2 /= 0 = -1
	| otherwise = minToAnagram (take half text) (drop half text) where
		half = (length text) `div` 2

getMultipleLines :: Int -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do          
        x <- getLine         
        xs <- getMultipleLines (n-1)
        let ret = (show (isPosibleAnagram x):xs)
        return ret

main :: IO()
main = do
	n <- getLine
	texts <- getMultipleLines (read n :: Int)
	putStrLn (intercalate "\n" texts)