def count_stairs(n):
    if n <= 1:
        return 1
    else:
        return count_stairs(n-1) + count_stairs(n-2)
