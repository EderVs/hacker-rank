""" Caesar Cipher """

raw_input()
text = list(raw_input())
k = int(raw_input())

for i in range(len(text)):
	change_letter_k = 0
	if ord(text[i]) >= 65 and ord(text[i]) <= 90:
		change_letter_k = ord(text[i]) + k
		while change_letter_k > 90:
			change_letter_k -= 26
		text[i] = chr(change_letter_k)

	elif ord(text[i]) >= 97 and ord(text[i]) <= 122:
		change_letter_k = ord(text[i]) + k
		while change_letter_k > 122:
			change_letter_k -=26
		text[i] = chr(change_letter_k)

print ''.join(text)