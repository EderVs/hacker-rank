""" Sherlock and The Beast """

cases = int(raw_input())
invalid_numbers = [1, 2, 4, 7]
for i in range(cases):
	number = int(raw_input())
	if number in invalid_numbers:
		print -1
	else:
		if number % 3 == 0:
			print '5' * number
		elif number % 3 == 1:
			print '5' * (((number / 3 - 3)) * 3) + '3' * 10
		else:
			print '5' * (((number / 3 - 1)) * 3) + '3' * 5