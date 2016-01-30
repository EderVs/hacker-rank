""" Flatland Space Stations """

def getDistance(x):
	if x % 2 == 0:
		return x / 2
	return (x+1) / 2

def getMaximunDistance(n, ms, first_m, last_m):
	count = 0
	max_distance = count
	for i in range(n):
		if i == first_m:
			max_distance = count
			count = 0
		elif i == (n-1):
			if last_m == i:
				max_distance = max(getDistance(count), max_distance)
			else:
				count += 1
				max_distance = max(count, max_distance)
		else:
			if ms:
				if i == ms[0]:
					max_distance = max(getDistance(count), max_distance)
					ms.pop(0)
					count = 0
				else:
					count += 1
			else:
				count +=1
	return max_distance

n,m = map(int, raw_input().split())
ms = (map(int, raw_input().split()))
ms.sort()
first_m = ms.pop(0)
if ms:
	last_m = ms[m-2]
else:
	last_m = first_m
print getMaximunDistance(n, ms, first_m, last_m)