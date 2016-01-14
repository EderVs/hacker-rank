import System.IO
import Data.List

decimalToBinary :: Int -> String
decimalToBinary 0 = ""
decimalToBinary n = decimalToBinary (n `div` 2) ++ show (n `mod` 2)

getMultipleLines :: Int -> IO [Int]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do          
        x <- getLine         
        xs <- getMultipleLines (n-1)    
        let ret = ((read x :: Int):xs)
        return ret

main :: IO()
main = do
	tests <- getLine
	numbers <- getMultipleLines (read tests :: Int)
	putStrLn (intercalate "\n" (map decimalToBinary numbers))