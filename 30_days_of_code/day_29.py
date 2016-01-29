""" Day 29 """

letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
	       'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
cases = int(raw_input())
for i in range(cases):
	funny = True
	s = raw_input()
	for j in range(1, len(s)):
		if abs(letters.index(s[j]) - letters.index(s[j - 1])) != (
		   abs(letters.index(s[len(s) - 1 - j]) - (
		   	   letters.index(s[len(s) - j])))):
			funny = False
			break
	if funny:
		print 'Funny'
	else:
		print 'Not Funny'