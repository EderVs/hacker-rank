""" Angry professor """

tests = int(raw_input())

for i in range(tests):
	information = raw_input().split()
	students = raw_input().split()
	ontime_students = 0

	for student in students:
		if int(student) <= 0:
			ontime_students += 1

	if ontime_students < int(information[1]):
		print 'YES'
	else:
		print 'NO'