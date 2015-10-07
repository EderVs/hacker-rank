""" Chocolate Feast """

cases = int(raw_input())
for i in range(cases):
	money,cost,wrapper_discount = map(int, raw_input().split())

	total_chocolates = money / cost
	current_chocolates = total_chocolates
	leftover_chocolates = 0
	while current_chocolates / wrapper_discount >= 1:
		leftover_chocolates = current_chocolates % wrapper_discount
		current_chocolates /= wrapper_discount
		total_chocolates += current_chocolates
		current_chocolates += leftover_chocolates

	print total_chocolates 