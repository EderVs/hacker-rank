""" Extra long factorials """

number = int(raw_input())
result = 1
for i in range(1, number + 1):
	result *= i
print result