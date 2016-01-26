""" Library Fine """

actual_return_date = raw_input().split()
expected_return_date = raw_input().split()

fine = 0
if int(actual_return_date[2]) > int(expected_return_date[2]):
	fine = 10000
elif int(actual_return_date[2]) == int(expected_return_date[2]):
	if int(actual_return_date[1]) > int(expected_return_date[1]):
		fine = (int(actual_return_date[1]) - int(expected_return_date[1])) * 500
	elif int(actual_return_date[1]) == int(expected_return_date[1]):
		if int(actual_return_date[0]) > int(expected_return_date[0]):
			fine = (int(actual_return_date[0]) - int(expected_return_date[0])) * 15

print fine