import System.IO

getColumns :: [String] -> [String]
getColumns ([]:_) = []
getColumns xs = (concat (map (\x -> take 1 x) xs)):(getColumns (map (\x -> drop 1 x) xs))

putOnRowsColumns :: String -> (Int,Int) -> [String]
putOnRowsColumns text (0,_) = []
putOnRowsColumns text (r,c) = (take c text):(putOnRowsColumns (drop c text) ((r-1),c))

getCorrectRowsColumns :: Int -> (Int, Int)
getCorrectRowsColumns x = if a * b >= x then (a,b) else (b,b) where
	a = (floor (sqrt (fromIntegral (x))))
	b = (ceiling (sqrt (fromIntegral (x))))

main :: IO()
main = do
	text <- getLine
	putStrLn (unwords (getColumns (putOnRowsColumns text (getCorrectRowsColumns (length text)))))