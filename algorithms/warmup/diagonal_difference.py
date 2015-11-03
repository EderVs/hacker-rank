""" Diagonal difference """

n = int(raw_input())
numbers = []
sum1 = 0
j = n - 1
for i in range(n):
	numbers.append(map(int, raw_input().split()))
	sum1 += numbers[i][i] - numbers[i][j]
	j -= 1

print abs(sum1 - sum2)		