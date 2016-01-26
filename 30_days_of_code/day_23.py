import sys
class Node:
    def __init__(self,data):
        self.right=self.left=None
        self.data = data
class Solution:
    def insert(self,root,data):
        if root==None:
            return Node(data)
        else:
            if data<=root.data:
                cur=self.insert(root.left,data)
                root.left=cur
            else:
                cur=self.insert(root.right,data)
                root.right=cur
        return root

    def levelOrder(self,root):
        n = 0
        level_order = []
        flag = True
        while flag:
            current_level = self.getLevel(root,n)
            if current_level == []:
                to_print = ' '.join(map(str, level_order))
                print to_print
                flag = False
            level_order += current_level
            n += 1

    def getLevel(self, root, n):
        if n == 0:
            if root != None:
                return [root.data]
            else:
                return []
        else:
            data_level = []
            if root.left != None:
                data_level += self.getLevel(root.left, n-1)
            if root.right != None:
                data_level += self.getLevel(root.right, n-1)
            return data_level




T=int(raw_input())
myTree=Solution()
root=None
for i in range(T):
    data=int(raw_input())
    root=myTree.insert(root,data)
myTree.levelOrder(root)