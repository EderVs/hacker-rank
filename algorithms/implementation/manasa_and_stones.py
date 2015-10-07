""" Manasa and Stones """

cases = int(raw_input())
for i in range(cases):
	n =int(raw_input())
	a =int(raw_input())
	b =int(raw_input())
	answer = []
	if a == b:
		answer.append((b * (n - 1)))
	else:
		for j in range(n):
			answer.append((a * (n - j - 1)) + (b * j))
	print " ".join(map(str, sorted(answer)))