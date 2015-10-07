""" Service Lane """

n,t = map(int, raw_input().split())
width = raw_input().split()
for x in range(t):
	i,j = map(int, raw_input().split())
	vehicle = 3
	for y in range(i, j + 1):
		vehicle = min(int(width[y]), vehicle)
	print vehicle