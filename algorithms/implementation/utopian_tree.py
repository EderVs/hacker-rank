""" Utopian Tree """

cases = int(raw_input())
for i in range(cases):
	height = 1
	cycles = int(raw_input())
	for j in range(cycles):
		if j % 2 == 0:
			height *= 2
		else:
			height += 1
	print height