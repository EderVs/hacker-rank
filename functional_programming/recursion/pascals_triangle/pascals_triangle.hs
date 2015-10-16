import Data.List

pascalTriangle 1 = [[1]]
pascalTriangle 2 = (pascalTriangle 1)++[[1,1]]
pascalTriangle n = pascalTriangle (n-1) ++ [getNumbers(last (pascalTriangle (n-1)))]

getNumbers last_lst = (1:[(last_lst!!i) + (last_lst!!(i+1)) | i <- [0..(length last_lst)-2]])++[1]

pascalToStr lst = concat [intercalate " " z | z <- [ y++["\n"] | y <- [map show y | y <- lst ]]]


main = do
	n <- getLine
	putStrLn (pascalToStr (pascalTriangle n))