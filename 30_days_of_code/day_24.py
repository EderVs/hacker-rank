class Node:
    def __init__(self,data):
        self.data = data
        self.next = None
class Solution:
    def insert(self,head,data):
        p = Node(data)        
        if head==None:
            head=p
        elif head.next==None:
            head.next=p
        else:
            start=head
            while(start.next!=None):
                 start=start.next
            start.next=p
        return head 
    def display(self,head):
        current = head
        while current:
            print current.data,
            current = current.next

    def removeDuplicates(self,head):
        now = head
        while now != None:
            if now.next != None:
                if now.next.data == now.data:
                    now.next = now.next.next
                else:
                    now = now.next
            else:
                now = now.next
        return head
      
  
mylist= Solution()
T=int(input())
head=None
for i in range(T):
    data=int(input())
    head=mylist.insert(head,data)   
head=mylist.removeDuplicates(head)
mylist.display(head);