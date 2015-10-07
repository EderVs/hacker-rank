""" Pangrams """

letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
	       'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
sentence = raw_input().lower()
is_pangram = True
for i in letters:
	if i not in sentence:
		is_pangram = False
		break

if is_pangram:
	print 'pangram'
else:
	print 'not pangram'