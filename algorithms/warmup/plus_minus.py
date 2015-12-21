""" Plus minus """

raw_input()
numbers = map(int, raw_input().split())

positive = 0
negative = 0
zero = 0
for i in numbers:
	if i > 0:
		positive += 1
	elif i < 0:
		negative += 1
	else:
		zero += 1

print round(positive/float(len(numbers)), 3)
print round(negative/float(len(numbers)), 3)
print round(zero/float(len(numbers)), 3)