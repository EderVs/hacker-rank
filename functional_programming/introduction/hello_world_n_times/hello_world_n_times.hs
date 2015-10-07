import Control.Monad

printHW n = when (n > 0) $ do
	printHW (n-1)
	putStrLn "Hello World"


main = do
	n <- readLn 
	printHW n