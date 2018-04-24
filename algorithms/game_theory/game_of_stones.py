""" Game of Stones """

t = int(input())


def game(n):
    array = []
    for i in range(n+1):
        if i - 2 >= 0:
            if not array[i - 2]:
                array.append(True)
                continue
        if i - 3 >= 0:
            if not array[i - 3]:
                array.append(True)
                continue
        if i - 5 >= 0:
            if not array[i - 5]:
                array.append(True)
                continue
        array.append(False)
    if array[-1]:
        return "First"
    return "Second"


for i in range(t):
    n = int(input())
    print(game(n))
