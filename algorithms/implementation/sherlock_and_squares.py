""" Sherlock and Squares """

from math import sqrt

cases = int(raw_input())
for i in range(cases):
	a,b = map(int, raw_input().split())
	count = 0
	if sqrt(a) - int(sqrt(a)) == 0:
		count = 1
	print count + int(sqrt(b)) - int(sqrt(a))