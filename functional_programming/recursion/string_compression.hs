import System.IO

countSameLetter :: Char -> String -> Int -> (String, String)
countSameLetter _ [] n = if n == 1 then ("", "") else (show n, "")
countSameLetter a (x:xs) n
	| a == x = countSameLetter x xs (n+1)
	| n == 1 = ("", (x:xs))
	| otherwise = (show n, (x:xs))

stringCompression :: String -> String
stringCompression [] = []
stringCompression (x:xs) = x:(n ++ stringCompression next)
	where
		(n, next) = countSameLetter x xs 1

main :: IO()
main = do
	text <- getLine
	putStrLn (stringCompression text)