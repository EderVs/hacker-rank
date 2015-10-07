""" Cut the sticks """

input()
sticks = map(int, raw_input().split())
while len(sticks) >= 1:
	print len(sticks)
	min_stick = min(sticks)
	i = 0
	while i < len(sticks):
		sticks[i] -= min_stick
		if sticks[i] <= 0:
			sticks.pop(i)
		else:
			i += 1