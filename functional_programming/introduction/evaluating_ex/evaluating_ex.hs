fact :: Double -> Double
fact x = product [1..x]

solve :: Double -> Double
solve x = 1 + (sum [(x**y)/(fact y) | y <- [1..9]])

main :: IO ()
main = getContents >>= mapM_ print. map solve. map (read::String->Double). tail. words