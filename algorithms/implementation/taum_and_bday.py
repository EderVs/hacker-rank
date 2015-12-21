""" Taum and B'day """

t = int(raw_input())
for i in range(t):
	b,w = map(int, raw_input().split())
	x,y,z = map(int, raw_input().split())
	print str(b * min(x, y + z) + w * min(y, x + z))