class Node:
    def __init__(self,data):
        self.right=self.left=None
        self.data = data
class Solution:
    def insert(self,root,data):
        if root==None:
            return Node(data)
        else:
            cur=Node(data)
            if data<=root.data:
                cur=self.insert(root.left,data)
                root.left=cur
            else:
                cur=self.insert(root.right,data)
                root.right=cur
        return root

    def getHeight(self,root):
        height_now = 0
        if root.left == None and root.right == None:
            return 1
        elif root.left == None or root.right == None:
            if root.left == None:
                height_now = self.getHeight(root.right)
            else:
                height_now = self.getHeight(root.left)
            return (height_now + 1)
        else:
            height_right = self.getHeight(root.right)
            height_left = self.getHeight(root.left)
            if height_right >= height_left:
                return (height_right + 1)
            return (height_left + 1)


T=int(raw_input())
myTree=Solution()
root=None
for i in range(T):
    data=int(raw_input())
    root=myTree.insert(root,data)
height=myTree.getHeight(root)
print height   