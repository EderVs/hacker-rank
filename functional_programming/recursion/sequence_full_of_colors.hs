import System.IO
import Data.List

is_full_of_colors :: String -> (Int,Int,Int,Int) -> Bool
is_full_of_colors [] (red,green,yellow,blue)
    | red == green && yellow == blue = True
    | otherwise = False

is_full_of_colors (x:xs) (red,green,yellow,blue)
    | x == 'R' = if (abs (red+1-green)) <= 1 then (is_full_of_colors xs (red+1,green,yellow,blue)) else False
    | x == 'G' = if (abs (green+1-red)) <= 1 then (is_full_of_colors xs (red,green+1,yellow,blue)) else False
    | x == 'Y' = if (abs (yellow+1-blue)) <= 1 then (is_full_of_colors xs (red,green,yellow+1,blue)) else False
    | x == 'B' = if (abs (blue+1-yellow)) <= 1 then (is_full_of_colors xs (red,green,yellow,blue+1)) else False

getMultipleLines :: Int -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do          
        x <- getLine         
        xs <- getMultipleLines (n-1)    
        let ret = (show (is_full_of_colors x (0,0,0,0))):xs
        return ret

main :: IO()
main = do
	t <- getLine
	xs <- getMultipleLines (read t :: Int)
	putStrLn (intercalate "\n" xs)
