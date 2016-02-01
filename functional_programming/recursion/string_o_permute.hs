import System.IO
import Data.List

permute :: Eq a => [a] -> [a]
permute [] = []
permute (x:y:xs) = y:x:permute xs

getMultipleLines :: Int -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do          
        x <- getLine         
        xs <- getMultipleLines (n-1)    
        let ret = (permute x:xs)
        return ret

main :: IO()
main = do
	t <- getLine
	xs <- getMultipleLines (read t :: Int)
	putStrLn (intercalate "\n" xs)