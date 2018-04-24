""" Fibonacci Modified """

t1, t2, n = list(map(int, input().split()))

def fibonacci(t1, t2, n):
    if n == 1:
        return t1
    if n == 2:
        return t2

    for i in range(n-1):
        aux = t1 + t2**2
        t1 = t2
        t2 = aux
    
    return t1

print(fibonacci(t1, t2, n))
