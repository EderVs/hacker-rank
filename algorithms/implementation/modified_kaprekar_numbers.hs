import System.IO
import Data.List
import Data.Char

toDigits :: Int -> [Int]
toDigits 0 = []
toDigits n = toDigits (div n 10) ++ [n - (div n 10) * 10]

digitsToInt :: [Int] -> Int
digitsToInt [] = 0
digitsToInt (x:xs) = x * 10^(length xs) + digitsToInt xs

getKaprekarNumbers :: Int -> Int -> [Int]
getKaprekarNumbers p q = [x | x <- [p..q], 
	let a = digitsToInt (fst (splitAt ((length (toDigits (x*x)) `div` 2)) (toDigits (x*x)))),
	let	b = digitsToInt (snd (splitAt ((length (toDigits (x*x)) `div` 2)) (toDigits (x*x)))),
	a + b == x]

main :: IO ()
main = do
    str_p <- getLine
    let p = read str_p :: Int
    str_q <- getLine
    let q = read str_q :: Int
    case (length (getKaprekarNumbers p q)) of
    	0 -> putStr "INVALID RANGE"
    	_ -> putStr (intercalate " " (map show (getKaprekarNumbers p q)))