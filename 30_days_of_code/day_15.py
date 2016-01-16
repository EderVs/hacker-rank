class Node:
	def __init__(self):
		self.data = None
		self.next = None


class Solution:
	def display(self,head):
		current = head
		while current:
			print current.data,
			current = current.next
	def insert(self,head,data): 
		my_pointing = head
		new_Node = Node()
		new_Node.data = data
		if my_pointing == None:
			return new_Node
		else:
			while my_pointing.next != None:
				my_pointing = my_pointing.next
			my_pointing.next = new_Node
			return head



mylist= Solution()
T=int(input())
head=None
for i in range(T):
	data=int(input())
	head=mylist.insert(head,data)    
mylist.display(head);