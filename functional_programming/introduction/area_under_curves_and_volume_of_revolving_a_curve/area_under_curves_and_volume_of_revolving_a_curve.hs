import Text.Printf (printf)

-- This function should return a list [area, volume].
solve :: Int -> Int -> [Int] -> [Int] -> [Double]
solve l r a b = [g (l * 1000) (r * 1000) 1 a b, 0.0]

equation :: [Int] -> [Int] -> Int -> Double
equation a b x = sum [(fromIntegral ((a)!!i))*((fromIntegral x)**((fromIntegral (b!!i))))/1000^^(b!!i) | i <- [0..(length a) - 1]]

f :: [Int] -> Int -> Int -> [Int]
f lst x limit = if ((head lst)) < limit - x then f (((head lst) + x):lst) x limit else lst

g :: Int -> Int -> Int -> [Int] -> [Int] -> Double
g l r x a b = sum [(equation a b z)*((fromIntegral x)/1000) | z <- ((f [l] x r))]

--Input/Output.
main :: IO ()
main = getContents >>= mapM_ (printf "%.1f\n"). (\[a, b, [l, r]] -> solve l r a b). map (map read. words). lines
