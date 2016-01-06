import System.IO

getAnswer :: Int -> [Char]
getAnswer n 
	| odd n = "Weird"
	| otherwise = if (n >= 2 && n <= 5) || (n > 20) then "Not Weird" else "Weird"

main :: IO()
main = do
	n <- getLine
	putStrLn (getAnswer (read n :: Int))