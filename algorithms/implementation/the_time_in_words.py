""" The Time in Words """

h = input()
m = input()

numbers = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eigth',
	'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen',
	'sixteen', 'seventeen', 'eigthteen', 'nineteen', 'twenty']

if m == 0:
	print numbers[h - 1], "o' clock"
elif m == 30:
	print 'half past', numbers[h - 1]
else:
	if m < 30:
		my_minutes = m
	else:
		my_minutes = 60 - m
	if my_minutes <= 20:
		if my_minutes == 1:
			current_minutes = str(numbers[0]) + ' minute'
		elif my_minutes == 15:
			current_minutes = 'quarter'
		else:
			current_minutes = str(numbers[my_minutes - 1]) + ' minutes'
	else:
		current_minutes = numbers[19] + ' ' + str(numbers[my_minutes - 21]) + ' minutes'
	if m < 30:
		print current_minutes, 'past', numbers[h - 1]
	else:
		print current_minutes, 'to', numbers[h]
