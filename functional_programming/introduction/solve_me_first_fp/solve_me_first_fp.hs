first_function a b = a + b

main = do
	num1 <- readLn
	num2 <- readLn
	let sum = first_function num1 num2

	print sum