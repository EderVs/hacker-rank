""" Day 5: Loops! """

T = input()
for i in range(T):
	a,b,n = map(int, raw_input().split())
	to_print = ""
	for j in range(n):
		a += (pow(2,j) * b)
		to_print += str(a) + " "
	print to_print