import System.IO

getHourglasses :: [[Int]] -> [Int]
getHourglasses matrix 
	| length matrix < 3 = []
	| otherwise = getLineHourglasses matrix ++ getHourglasses (tail matrix)

removeFirsts :: [[Int]] -> Int -> [[Int]]
removeFirsts matrix 0 = matrix
removeFirsts matrix n
	| length (head matrix) == 0 = []
	| otherwise = tail (head matrix):removeFirsts (tail matrix) (n-1)

getLineHourglasses :: [[Int]] -> [Int]
getLineHourglasses matrix
	| length (head matrix) < 3 = []
	| otherwise = (sum [(matrix!!y)!!x | y <- [0..2], y /= 1, x <- [0..2]]) + ((matrix!!1)!!1):getLineHourglasses (removeFirsts matrix 3) where
		line_1 = matrix!!0
		line_2 = matrix!!2

getMultipleLines :: Int -> IO [[Int]]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do          
        x <- getLine         
        xs <- getMultipleLines (n-1)    
        let ret = ((map (\y -> read y :: Int) (words x)):xs)
        return ret

main :: IO()
main = do
	matrix <- getMultipleLines 6
	putStrLn (show (maximum (getHourglasses matrix)))