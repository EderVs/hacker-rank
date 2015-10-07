""" Cavity Map """

n = int(raw_input())
numbers = []
for i in range(n):
	numbers.append(map(int, list(raw_input())))

for i in range(1, len(numbers) - 1):
	for j in range(1, len(numbers[i]) - 1):
		if (numbers[i][j] > numbers[i - 1][j] and 
			numbers[i][j] > numbers[i + 1][j] and
			numbers[i][j] > numbers[i][j - 1] and
			numbers[i][j] > numbers[i][j + 1]):
			numbers[i][j] = 'X'

for i in range(n):
	print ''.join(map(str, numbers[i]))