""" Minimum Absolute Difference in an Array """

n = int(input())
xs = list(map(int, input().split()))

def get_minimum(xs, n):
    xs.sort()
    minimum = abs(xs[0] - xs[1])
    for i in range(1, n-1):
        minimum = min(minimum, abs(xs[i] - xs[i+1]))

    return minimum

print(get_minimum(xs, n))
