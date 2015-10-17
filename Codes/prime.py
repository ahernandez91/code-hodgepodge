def is_prime(n):
    if n < 2:
        return False
    def prime_counter(k):
        if k >= n:
            return True
        if n%k == 0:
            return False
        return prime_counter(k + 1)
    return prime_counter(2)

def sum_primes(n):
    if n == 2:
        return 2
    elif is_prime(n):
        return n + sum_primes(n-1)
    else:
        return sum_primes(n-1)

def is_fib(n):
    fib1, fib2 = 0, 1
    while fib1 < n:
        fib1, fib2 = fib2, fib1 + fib2
    return n == fib1

def is_ascending(n):
    ones, tens = n % 10, (n//10) % 10
    if tens == 0:
        return True
    elif tens < ones or ones == tens:
        return False
    else:
        return is_ascending((n//10))

def count_one(n):
    total = 0
    while n != 0:
        if n % 10 == 1:
            total += 1
        n = n // 10
    return total

def total_count(n):
    '''Returns the total count of the number of 1's from the numbers 1 to n '''
    total_count, k = 0, 1
    while k <= n:
        total_count = total_count + count_one(k)
        k += 1
    return total_count
