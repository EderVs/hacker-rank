f :: Int -> [Int] -> [Int]
f n arr = if length arr > 0 then [head arr | _<-[1..n]]++(f n (tail arr)) else []

-- This part handles the Input and Output and can be used as it is. Do not modify this part.
main :: IO ()
main = getContents >>=
		mapM_ print. (\(n:arr) -> f n arr). map read. words