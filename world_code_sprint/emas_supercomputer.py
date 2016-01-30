""" Ema's Supercomputer """

def check(x, y, n, m, grid, blacklist):
	return x >= 0 and x < m and y >= 0 and y < n and grid[y][x] == 'G' and not ((x,y) in blacklist)

def maximun_plus(x, y, n, m, grid, blacklist):
	if (not check(x,y,n,m,grid,blacklist)):
		return 0
	area = 1
	difference = 1
	while check(x,y-difference,n,m,grid,blacklist) and check(x-difference,y,n,m,grid, blacklist) and (
		check(x,y+difference,n,m,grid,blacklist) and check(x+difference,y,n,m,grid, blacklist)):
		difference += 1
		area += 4
	return area


def put_in_blacklist(x, y, area):
	blacklist = [(x,y)]
	difference = (area-1)/4
	for i in range(1,difference+1):
		blacklist.append((x-i,y))
		blacklist.append((x+i,y))
		blacklist.append((x,y-i))
		blacklist.append((x,y+i))
	return blacklist

n,m = map(int, raw_input().split())
grid = []
first_area = 0
second_area = 0
first_c = ()
for i in range(n):
	grid.append(raw_input())

for i in range(n):
	for j in range(m):
		current_plus = maximun_plus(j, i, n, m, grid, [])
		if current_plus >= first_area:
			first_area = current_plus
			first_c = (j,i)

blacklist = put_in_blacklist(first_c[0], first_c[1], first_area)

for i in range(n):
	for j in range(m):
		if not((j,i) in blacklist):
			current_plus = maximun_plus(j, i, n, m, grid, blacklist)
			if current_plus >= second_area:
				second_area = current_plus

print first_area * second_area
