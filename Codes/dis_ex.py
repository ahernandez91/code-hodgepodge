def square(x):
    return x*x

def and_add(f,n):
    def add_n(k):
        return f(k) + n
    return add_n

