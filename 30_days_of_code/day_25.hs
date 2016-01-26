import System.IO
import Data.List

isDivided :: Int -> [Int] -> Bool
isDivided n [] = False
isDivided n (x:xs)
	| n `mod` x == 0 = True
	| otherwise = isDivided n xs

isPrime :: Int -> String
isPrime n
	| n == 1 = "Not prime"
	| n == 2 = "Prime"
	| not (isDivided n [2..((round (sqrt (fromIntegral n))) + 1)]) = "Prime"
	| otherwise = "Not prime"

getMultipleLines :: Int -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do          
        x <- getLine         
        xs <- getMultipleLines (n-1)    
        let ret = ((isPrime (read x :: Int)):xs)
        return ret

main :: IO()
main = do
	t <- getLine
	primes <- getMultipleLines (read t :: Int)
	putStrLn (intercalate "\n" primes)