import Text.Printf (printf)

-- This function should return a list [area, volume].
solve :: Int -> Int -> [Int] -> [Int] -> [Double]
solve l r a b = [getArea (l * 1000) (r * 1000) 1 a b, getVolume (l * 1000) (r * 1000) 1 a b]

equation :: [Int] -> [Int] -> Int -> Double
equation a b x = sum [(fromIntegral ((a)!!i))*((fromIntegral x)**((fromIntegral (b!!i))))/1000^^(b!!i) | i <- [0..(length a) - 1]]

getSides :: [Int] -> Int -> Int -> [Int]
getSides lst x limit = if ((head lst)) < limit - x then getSides (((head lst) + x):lst) x limit else lst

getArea :: Int -> Int -> Int -> [Int] -> [Int] -> Double
getArea l r x a b = sum [(equation a b z)*((fromIntegral x)/1000) | z <- ((getSides [l] x r))]

getVolume :: Int -> Int -> Int -> [Int] -> [Int] -> Double
getVolume l r x a b = pi * (sum [(((equation a b z)*((fromIntegral x)/1000))**2.0) * 1000 | z <- ((getSides [l] x r))])

--Input/Output.
main :: IO ()
main = getContents >>= mapM_ (printf "%.1f\n"). (\[a, b, [l, r]] -> solve l r a b). map (map read. words). lines
