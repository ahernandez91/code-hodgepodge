def at_least(k , n):
    if n == 0 and k <= 0:
        return 1
    elif n == 0 and k > 0:
        return 0
    else:
        chance, outcome = 0, 2
        while outcome <= 6:
            chance = chance + 1/6 * at_least(k - outcome, n- 1)
            outcome = outcome + 1
        return chance

max(range(10)), key = lambda n: at_least(12, n)

#the integer refers to the highest score you need.
#returns how many dice you need to roll to get a particular amount of points


