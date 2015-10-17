def find_zero(f, df):
	def near_zero(x):
		return approx_eq(f(x), 0)
	return improve(newton_update(f, df), nearzero)

def newton_update(f, df):
	def update(x):
		return x = f(x)/df(x)
	return update

def square_root(a):
	def f(x):
		return x*x -2
	def df(x):
		return 2*x
	return find_zero(f, df)





#Bisection Method:
# def square_root(a):
# 	def update(x):
# 			return square_root_update(x, a)
# 	def close(x):
# 			return approx_eq(x*x, a)
# 	return improve(update, close)

# def square_root_update(x, a):
# 	return (x + a/x)/2

def improve(update, close, guess =1):
	while not close(guess):
		guess = update(guess)
	return guess

def approx_eq(x, y, tol = 1e-15):
	return abs(x-y) < tol


def slope(f, x, a = 1e-10):
	return (f(x+a) - f(x))/a

def approx_zero(f):
	df = lambda x: slope(f, x)
	return find_zero(f, df)
derive = lambda f: lambda x:slope(f, x)

def critical(f):
	return f(approx_zero(derive(f)))

def inverse(f):
	def g(y):
		return approx_zero(lambda x: f(x) - y)
	return g
















