import System.IO
import Data.List

rotateList :: Eq a => [a] -> [a]
rotateList [] = []
rotateList xs = (tail xs) ++ [head xs]

getAllRotations :: Eq a => [a] -> Int -> [[a]]
getAllRotations xs 0 = [rotateList xs]
getAllRotations xs n = rotatedList:getAllRotations rotatedList (n-1) where
	rotatedList = rotateList xs

getMultipleLines :: Int -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do          
        x <- getLine         
        xs <- getMultipleLines (n-1)    
        let ret = (unwords (getAllRotations x ((length x)-1)):xs)
        return ret

main :: IO()
main = do
	t <- getLine
	xs <- getMultipleLines (read t ::Int)
	putStrLn (intercalate "\n" xs)