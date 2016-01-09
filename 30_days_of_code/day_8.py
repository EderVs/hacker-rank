""" Day 8: Dictionaries and Maps! """

n = input()
phones_dict = {}
for i in range(n):
	name = raw_input()
	phone = raw_input()
	phones_dict[name] = phone
for i in range(n):
	name = raw_input()
	phone = phones_dict.get(name, "Not found")
	if phone != "Not found":
		print name + "=" + phone
	else:
		print phone