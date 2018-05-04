""" Breadth First Search: Shortest Reach """

class Node:
    
    def __init__(self, element, level=-1):
        self.element = element
        self.neighbors = set()
        self.level = level

    def add_neighbor(self, neighbor):
        self.neighbors.add(neighbor)

    def __repr__(self):
        return str(self.element) + " " + str(self.level)

class Graph:

    def __init__(self, elements=[]):
        self.elements = {}
        for element in elements:
            new = Node(element)
            self.elements[element] = new

    def add_element(self, element):
        new = Node(element)
        self.elements[element] = new

    def add_edge(self, element1, element2):
        self.elements[element1].neighbors.add(self.elements[element2])
        self.elements[element2].neighbors.add(self.elements[element1])

    def bfs_element(self, start):
        # Setting all nodes to distance to -1
        for element in self.elements.values():
            element.level = -1

        self.elements[start].level = 0
        queue = [self.elements[start]]
        while queue != []:
            current_node = queue.pop(0)
            for neighbor in current_node.neighbors:
                if neighbor.level == -1 or neighbor.level > current_node.level + 1:
                    neighbor.level = current_node.level + 1
                    queue.append(neighbor)


t = int(input())
for _ in range(t):
    n, m = list(map(int, input().split()))

    g = Graph(list(range(1, n+1)))
    for _ in range(m):
        u, v = list(map(int, input().split()))
        g.add_edge(u, v)

    i = int(input())

    g.bfs_element(i)

    to_print = []
    for element in g.elements.keys():
        if g.elements[element].element == i:
            continue
        if g.elements[element].level == -1:
            to_print.append(str(g.elements[element].level))
            continue
        to_print.append(str(g.elements[element].level*6))


    print(" ".join(to_print))

