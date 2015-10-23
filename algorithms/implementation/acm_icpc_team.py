""" ACM ICPC Team """

n,m = map(int, raw_input().split())
people = []
max_score = [0, 0]
max_people = ["", ""]
for i in range(n):
	current_knowledge = int(raw_input())
	people.append(current_knowledge)
	
	for j in range(len(people)-1):
		current_people = people[j]
		current_knowledge = str(current_people + people[i])
		score = m
		if len(current_knowledge) != m:
			score -=  m - len(current_knowledge)
		for k in current_knowledge:
		 	if k == "0":
		 		score -= 1
		if score > max_score[0]:
		 	max_score[0] = score
		 	max_score[1] = 1
		elif score == max_score[0]:
		 	max_score[1] += 1

print max_score[0], "\n", max_score[1]