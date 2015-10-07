""" Simple arrat sum """

raw_input()
numbers = raw_input().split()
my_sum = 0
for i in numbers:
	my_sum += int(i)

print my_sum