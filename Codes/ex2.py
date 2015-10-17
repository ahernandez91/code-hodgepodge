def sum_multiples(m, n, limit):
    m_mult, n_mult, k = 0, 0, 1
    while k < limit:
        if k%m == 0:
            m_mult += k
        elif k%n == 0:
            n_mult += k
        k += 1
    return m_mult + n_mult

def over_nine_thousand(o_list):
    i = 0
    for i in range(len(o_list)):
        o_list[i] = o_list[i] + 9000
        i = i + 1
    return o_list

def make_skipper(n):
    def skip(x):
        k = 0
        while k <= x:
            if k % n != 0:
                print(k)
            k += 1
    return skip

def compose(f, g):
    def blah(x):
        return f(g(x))
    return blah

def make_alternator(f, g):
    def alternator(x):
        k =1
        while k <= x:
            if k % 2 == 1:
                print(f(k))
            else:
                print(g(k))
            k += 1
    return alternator




