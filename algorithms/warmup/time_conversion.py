""" Time Conversion """

time = raw_input()
time_format = time[-2:]

time = time[:-2]
hour = int(time[:2])
if time_format == 'PM':
	if hour != 12:
		time = str(hour + 12) + time[2:]
else:
	if hour == 12:
		time = '00' + time[2:]

print time