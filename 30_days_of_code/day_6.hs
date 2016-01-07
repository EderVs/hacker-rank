import System.IO

repeat_symbol :: Int -> Char -> [Char]
repeat_symbol 0 _ = []
repeat_symbol n symbol = [symbol] ++ repeat_symbol (n-1) symbol

get_piramid :: Int -> Int -> [Char]
get_piramid _ 0 = []
get_piramid n x = (repeat_symbol (x-1) ' ') ++ (repeat_symbol (n-x+1) '#') ++ "\n" ++ (get_piramid n (x-1))

main :: IO()
main = do
	n <- getLine
	putStrLn (take ((length (get_piramid (read n :: Int) (read n :: Int)))-1) (get_piramid (read n :: Int) (read n :: Int)))