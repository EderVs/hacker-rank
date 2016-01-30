import System.IO

getDistance :: Int -> Int
getDistance x = if odd x then ((x+1) `div` 2) else (x `div` 2)

getMaxDistance :: Int -> [Int] -> Int -> Int -> Int
getMaxDistance n stations count y =
	if y == n then
		if elem y stations then
			if y == stations!!0 then
				count
			else
				getDistance count
		else
			(count + 1)
	else
		if elem y stations then
			if y == stations!!0 then
				max (getMaxDistance n stations 0 (y+1)) count
			else
				max (getMaxDistance n stations 0 (y+1)) (getDistance count)
		else
			getMaxDistance n stations (count+1) (y+1)

main :: IO()
main = do
	n_s <- getLine
	m_s <- getLine
	let n = (read ((words n_s)!!0) :: Int)
	let m = map (\x -> read x :: Int) (words m_s)
	putStrLn (show (getMaxDistance (n-1) m 0 0))