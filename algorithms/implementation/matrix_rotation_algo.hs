import System.IO

init' :: [a] -> [a]
init' [] = []
init' xs = init xs

tail' :: [a] -> [a]
tail' [] = []
tail' xs = tail xs

head' :: [[String]] -> [String]
head' [] = []
head' xs = head xs

last' :: [[String]] -> [String]
last' [] = []
last' xs = last xs

getFirsts :: [[String]] -> [String]
getFirsts xs = map (head) xs

getLasts :: [[String]] -> [String]
getLasts xs = map (last) xs

removeFirsts :: [[String]] -> [[String]]
removeFirsts ([]:_) = []
removeFirsts xs = map (tail) xs

removeLasts :: [[String]] -> [[String]]
removeLasts ([]:_) = []
removeLasts xs = map (init) xs

putLasts :: [String] -> [[String]] -> Int -> [[String]]
putLasts _ _ 0 = []
putLasts (x:xs) [] n = [x]	:putLasts xs [] (n-1)
putLasts (x:xs) (y:ys) n = (y ++ [x]):putLasts xs ys (n-1)

putFirsts :: [String] -> [[String]] -> Int -> [[String]]
putFirsts _ _ 0 = []
putFirsts [] ys _ = ys
putFirsts (x:xs) (y:ys) n = (x:y):putFirsts xs ys (n-1)

coverToOneDimension :: [[String]] -> [String]
coverToOneDimension matrix 
	| length matrix == 1 = head matrix
	| otherwise = head' matrix ++ getLasts core ++ reverse (last' matrix) ++ firsts where
		core = init' (tail' matrix)
		firsts = if length (head' matrix) == 1 then [] else getFirsts (reverse core)

getMatrixCore :: [[String]] -> [[String]]
getMatrixCore matrix = core where
	core' = init' (tail' matrix)
	core = if removeLasts (removeFirsts core') == [[]] then [] else removeLasts (removeFirsts core')

rotateOneDimension :: [String] -> [String]
rotateOneDimension [] = []
rotateOneDimension xs = (tail' xs) ++ [head xs]

rotateNOneDimension :: [String] -> Int -> [String]
rotateNOneDimension text 0 = text
rotateNOneDimension text n = rotateOneDimension (rotateNOneDimension text (n-1))

putCover :: [String] -> [[String]] -> Int -> Int -> [[String]]
putCover cover [] n m = [take n cover] ++ putFirsts (reverse last_m) (putLasts (drop n cover) [[]] m) m ++ bottom where
	last_m = if n == 1 then [] else drop ((length cover)-m) cover
	bottom = if (length cover) - n == 0 then [] else [reverse (take n (drop (n+m) cover))]
putCover cover core n m = [take n cover] ++ putFirsts (reverse last_m) (putLasts (drop n cover) core m) m ++ [reverse (take n (drop (n+m) cover))] where
	last_m = drop ((length cover)-m) cover

oneDimensionToMatrix :: [[String]] -> Int -> Int -> [[String]]
oneDimensionToMatrix _ 0 _ = []
oneDimensionToMatrix [] _ _ = []
oneDimensionToMatrix (cover:core) n m = putCover cover (oneDimensionToMatrix core (n-2) (m-2)) n m

rotateMatrix :: [[String]] -> Int -> Int -> Int -> [[String]]
rotateMatrix [] _ _ _ = []
rotateMatrix matrix _ _ 0 = matrix
rotateMatrix matrix n m x = putCover (rotateNOneDimension (coverToOneDimension matrix) x) (rotateMatrix (getMatrixCore matrix) (n-2) (m-2) x) n m

getMultipleLines :: Int -> IO [[String]]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do          
        x <- getLine         
        xs <- getMultipleLines (n-1)    
        let ret = (words x:xs)
        return ret

matrixListToString :: [[String]] -> String
matrixListToString [] = ""
matrixListToString (x:xs) = (unwords x) ++ "\n" ++ matrixListToString xs

main :: IO()
main = do
	f_line <- getLine
	let args = words f_line
	matrix <- getMultipleLines (read (args!!0) :: Int)
	putStrLn (matrixListToString (rotateMatrix matrix (read (args!!1) :: Int) ((read (args!!0) :: Int)-2) (read (args!!2) :: Int)))