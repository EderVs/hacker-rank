absolute :: Int -> Int
absolute n = if n >= 0 then n else (-n)

f arr = [ absolute x | x <- arr]

main = do
   inputdata <- getContents
   mapM_ putStrLn $ map show $ f $ map (read :: String -> Int) $ lines inputdata