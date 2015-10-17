def fizzbuzz(n):
    if n < 1:
        print(n)
    else:
        fizzbuzz(n-1)
        if n % 3 == 0:
            print('fizz!')
        elif n% 5 == 0:
            print('buzz!')
        elif n% 5 == 0 and n% 3 == 0:
            print("fizzbuzz!!!")
        else:
            print(n)


def is_list(e):
  """ tests if an element is a list.
  >>> is_list([1, 2])
  True
  >>> is_list(4)
  False
  """
  return type(e) == list

def is_int(e):
  """ tests if an element is an integer
  >>> is_int([1, 2])
  False
  >>> is_int(4)
  True
  """
  return type(e) == int

def replace_all_deep(d, x, y):
    for key, value in d.items():
        if type(value) is int:
            if value == x:
                d[key] = y
        else:
            first_value = d.pop(key)
            d[key] = replace_all_deep(first_value, x, y)
    return d
d = {1: {2: 3, 3: 4}, 2: {4: 4, 5: {9: 3, 0: 5}}}

def reverse_list(x):
    for i in range(len(x)//2): #swapping algorithm, need only go through half the list
        x[i], x[len(x) -i -1] = x[len(x) - i - 1], x[i] #swapping occurs here, must be done\\
                                                        #on the same line
        #return nothing because this a mutation, the original list is now modified.

def has_seven(k):
    if k % 10 == 7:
        return True
    elif k < 10:
        return False
    else:
        return has_seven(k // 10)

def make_pingpong_tracker():
    index, value, add = 0, 0, True # need an index to keep track of indicies in sequence
    def tracker():
        nonlocal index, value, add
        index +=1
        if add:
            value += 1
        else:
            value -= 1
        if has_seven(index) or index % 7 == 0:
            add = not add #when the index meets the above conditions we stop adding
        return value
    return tracker


class Insurance:
    def __init__(self, name):
        self.name = name
        self.times_alerted = 0

    def phone(self):
        print('Alerting', self.name)
        self.times_alerted += 1

class Car:
    def __init__(self, name, insurance):
        self.name = name
        self.insurance = insurance
    def drive(self, name):
        if name == self.name:
            print(self.name, 'is driving')
        else:
            return self.insurance.phone()

    def pop_tire(self):
        self.insurance.phone()
        print(self.insurance.times_alerted)


class Pet:
    x = print('Yay!')
    color = "Red"
    name = "Clifford"

    def __init__(self, num_legs):
        print("A new pet!")
        self.num_legs = num_legs
    def sleep():
        print("Zzzz")

class RubberDuck(Pet):
    color = "Yellow"
    def __init__(self):
        self.voice = print("Quack")
        Pet.name = "Daisy"
        name = 'Daffy'
        self.num_legs = Pet(0).num_legs

    def debug(self):
        print("What is wrong?")
        return self.voice

class Foo(object):
    x = 'bam'
    y = 'barbie'

def __init__(self, x):
    self.x = x

def baz(self):
    return type(self).x + self.x

def aussie(self):
    return y

class Bar(Foo):
    x = 'boom'

    def __init__(self, x):
        Foo.__init__(self, 'er' + x)

class Foobar(Bar):
    y = 'mate'
























