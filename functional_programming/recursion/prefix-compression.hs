import System.IO

check_equals :: String -> String -> Int -> String -> (String,Int,String,String)
check_equals (x:xs) (y:ys) n str
    | x == y = check_equals xs ys (n+1) (x:str)
    | otherwise = (str,n,x:xs,y:ys)

check_equals xs ys n str = (str,n,xs,ys)

prefix_compression :: String -> String -> String
prefix_compression xs ys = (show(n)++" "++reverse(prefix)++"\n"++show(length(x))++" "++x++"\n"++show(length(y))++" "++y)
    where
        (prefix,n,x,y) = check_equals xs ys 0 ""

main :: IO()
main = do
    x <- getLine
    y <- getLine
    putStrLn (prefix_compression x y)
