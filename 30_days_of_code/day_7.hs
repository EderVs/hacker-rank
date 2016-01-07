import System.IO

main :: IO()
main = do
	_ <- getLine
	numbers <- getLine
	putStrLn (unwords (reverse (words numbers)))