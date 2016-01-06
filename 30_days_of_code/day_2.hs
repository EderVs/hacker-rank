import System.IO

getPercentaje :: Float -> Int -> Float
getPercentaje x p = ((fromIntegral p) * x)/100

getFinalPrice :: Float -> Int -> Int -> Int
getFinalPrice m t x = round (m + (getPercentaje m t) + (getPercentaje m x))

main :: IO ()
main = do
	m <- getLine
	t <- getLine
	x <- getLine
	putStrLn ("The final price of the meal is $" ++ (show (getFinalPrice (read m :: Float) (read t :: Int) (read x :: Int))) ++ ".")