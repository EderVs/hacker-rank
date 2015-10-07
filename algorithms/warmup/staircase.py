""" Staircase """

number = int(raw_input())

for i in range(1, number + 1):
	print ' ' * (number - i) + '#' * i