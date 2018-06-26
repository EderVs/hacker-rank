""" The coin change problem """

n, m = list(map(int, input().split()))

coins = list(map(int, input().split()))

def change(coins, n):
    change = [[0 for j in range(len(coins)+1)] for i in range(n+1)]

    for j in range(1, len(coins) + 1):
        change[0][j] = 1

    for i in range(1, n+1):
        for j in range(1, len(coins)+1):
            change[i][j] = change[i][j-1]
            if i - coins[j-1] >= 0:
                change[i][j] += change[i - coins[j-1]][j]


    return change[-1][-1]

    """
    if n == 0:
        return 1

    if n < 0:
        return 0

    if coins == []:
        return 0

    return change(coins[:-1], n) + change(coins, n - coins[-1])
    """

print(change(coins, n))
