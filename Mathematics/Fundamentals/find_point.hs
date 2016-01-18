import System.IO

simetricPoint :: Num a => Ord a => (a,a) -> (a,a) -> (a,a)
simetricPoint (ax,ay) (bx, by) = (bx + bx - ax, by + by - ay)

getMultipleLines :: Int -> IO [(Int,Int)]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do          
        x <- getLine         
        xs <- getMultipleLines (n-1)
        let num = map (\y -> read y :: Int) (words x)    
        return (simetricPoint (num!!0,num!!1) (num!!2,num!!3):xs)

pairTupleToString :: Num a => Show a => [(a,a)] -> String
pairTupleToString [] = []
pairTupleToString (x:xs) = show (fst x) ++ " " ++ show (snd x) ++ "\n" ++ pairTupleToString xs

main :: IO()
main = do
	t <- getLine
	simetricPoints <- getMultipleLines (read t :: Int)
	putStrLn (pairTupleToString simetricPoints)