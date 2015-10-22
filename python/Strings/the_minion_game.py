""" The Minion Game """

vowels = ['A','E','I','O','U']
word = raw_input()
stuart_score = 0
kevin_score = 0

for i in xrange(len(word)):
	if word[i] in vowels:
		kevin_score += len(word) - i
	else:
		stuart_score += len(word) - i

if stuart_score > kevin_score:
	print 'Stuart', stuart_score
elif kevin_score > stuart_score:
	print 'Kevin', kevin_score
else:
	print "Draw"