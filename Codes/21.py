goal = 21
def play(strategy0, strategy1):
    n = 0
    who = 0
    while n < goal:
        n = n + (strategy1 if who else strategy0)(n)
        who = 1 - who
    return who

def constant(k):
    return lambda n: k


