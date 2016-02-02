import System.IO
import Data.List

reduce :: Eq a => [a] -> [a] -> [a]
reduce [] _ = []
reduce (x:xs) rs
	| elem x rs = reduce xs rs
	| otherwise = x:reduce xs (x:rs)

main :: IO()
main = do
	xs <- getLine
	putStrLn (reduce xs [])