""" Diagonal difference """

n = int(raw_input());
numbers = []
for i in range(n):
	numbers.append(raw_input().split())

flag = 1
difference = 0
change = 0
for j in range(2):
	for i in range(n):
		difference += flag * (
			int(numbers[i][change + (flag * i)])
		)
	flag = -1
	change = n - 1

if difference < 0:
	difference *= -1

print difference