""" Find Digits """

cases = int(raw_input())
for i in range(cases):
	count = 0
	number = raw_input()
	for digit in number:
		if digit != '0':
			if int(number) % int(digit) == 0:
				count += 1
	print count