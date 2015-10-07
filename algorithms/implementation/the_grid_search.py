""" The Grid Search """

cases = int(raw_input())
for case in range(cases):
	r1,c1 = map(int, raw_input().split())
	grid_g = []
	for i in range(r1):
		grid_g.append(raw_input())
	r2,c2 = map(int, raw_input().split())
	grid_p = []
	for i in range(r2):
		grid_p.append(raw_input())
	
	is_pattern = 'NO'

	for i in range(0, r1 - r2 + 1):
		index = grid_g[i].find(grid_p[0])
		if index >= 0:
			correct = 1
			for j in range(1, r2):
				if grid_g[i+j][index:index + (c2)] == grid_p[j]:
					correct += 1
				else:
					break
			if correct == r2:
				is_pattern = 'YES'
				break

	print is_pattern
