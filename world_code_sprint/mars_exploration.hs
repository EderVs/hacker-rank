import System.IO

checkSOS :: String -> Int
checkSOS sos = foldr (\(x, y) z -> if x == y then z else (z+1)) 0 (zip sos "SOS")

checkMessage :: String -> Int
checkMessage [] =  0
checkMessage (s1:o:s2:xs) = (checkSOS (s1:o:[s2])) + (checkMessage xs)

main :: IO()
main = do
	message <- getLine
	putStrLn (show (checkMessage message))