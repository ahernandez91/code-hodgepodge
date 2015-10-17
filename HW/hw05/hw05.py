def make_withdraw(balance, password):

    """Return a password-protected withdraw function.

    >>> w = make_withdraw(100, 'hax0r')
    >>> w(25, 'hax0r')
    75
    >>> w(90, 'hax0r')
    'Insufficient funds'
    >>> w(25, 'hwat')
    'Incorrect password'
    >>> w(25, 'hax0r')
    50
    >>> w(75, 'a')
    'Incorrect password'
    >>> w(10, 'hax0r')
    40
    >>> w(20, 'n00b')
    'Incorrect password'
    >>> w(10, 'hax0r')
    "Your account is locked. Attempts: ['hwat', 'a', 'n00b']"
    >>> w(10, 'l33t')
    "Your account is locked. Attempts: ['hwat', 'a', 'n00b']"
    """
    pass_store = []
    def withdraw(amount, attempt_pass):
        nonlocal balance
        if len(pass_store) == 3:
            return 'Your account is locked. Attempts: ' + str(pass_store)
        elif attempt_pass != password:
            pass_store.append(attempt_pass)
            return 'Incorrect password'
        elif amount > balance:
            return 'Insufficient funds'
        else:
            balance = balance - amount
            return balance
    return withdraw
def make_joint(withdraw, old_password, new_password):

    """Return a password-protected withdraw function that has joint access to
    the balance of withdraw.

    >>> w = make_withdraw(100, 'hax0r')
    >>> w(25, 'hax0r')
    75
    >>> make_joint(w, 'my', 'secret')
    'Incorrect password'
    >>> j = make_joint(w, 'hax0r', 'secret')
    >>> w(25, 'secret')
    'Incorrect password'
    >>> j(25, 'secret')
    50
    >>> j(25, 'hax0r')
    25
    >>> j(100, 'secret')
    'Insufficient funds'

    >>> j2 = make_joint(j, 'secret', 'code')
    >>> j2(5, 'code')
    20
    >>> j2(5, 'secret')
    15
    >>> j2(5, 'hax0r')
    10

    >>> j2(25, 'password')
    'Incorrect password'
    >>> j2(5, 'secret')
    "Your account is locked. Attempts: ['my', 'secret', 'password']"
    >>> j(5, 'secret')
    "Your account is locked. Attempts: ['my', 'secret', 'password']"
    >>> w(5, 'hax0r')
    "Your account is locked. Attempts: ['my', 'secret', 'password']"
    >>> make_joint(w, 'hax0r', 'hello')
    "Your account is locked. Attempts: ['my', 'secret', 'password']"
    """
    account = withdraw(0, old_password)
    if type(account) != int :
        return account
    def joint_account(amount, password):
        if password == new_password:
            password = old_password
        return withdraw(amount, password)
    return joint_account



class VendingMachine:
    """A vending machine that vends some product for some price.

    >>> v = VendingMachine('candy', 10)
    >>> v.vend()
    'Machine is out of stock.'
    >>> v.restock(2)
    'Current candy stock: 2'
    >>> v.vend()
    'You must deposit $10 more.'
    >>> v.deposit(7)
    'Current balance: $7'
    >>> v.vend()
    'You must deposit $3 more.'
    >>> v.deposit(5)
    'Current balance: $12'
    >>> v.vend()
    'Here is your candy and $2 change.'
    >>> v.deposit(10)
    'Current balance: $10'
    >>> v.vend()
    'Here is your candy.'
    >>> v.deposit(15)
    'Machine is out of stock. Here is your $15.'
    """
    def __init__(self, item, price):
        self.item_stock = 0
        self.current_deposit = 0
        self.item = item
        self.price = price
    def restock(self, amount):
        self.item_stock += amount
        return 'Current ' + str(self.item) + ' stock: ' + str(self.item_stock)
    def deposit(self, depo_amount):
        self.current_deposit += depo_amount
        if self.item_stock == 0:
            return 'Machine is out of stock. Here is your $' + str(depo_amount) + '.'
        return 'Current balance: $' + str(self.current_deposit)
    def vend(self):
        if self.item_stock == 0:
            return 'Machine is out of stock.'
        elif self.current_deposit != self.price and self.price > self.current_deposit:
            return 'You must deposit $' + str(self.price - self.current_deposit) + ' more.'
        else:
            if self.current_deposit > self.price:
                print('\'Here is your ' + str(self.item) + ' and $' + \
                    str(self.current_deposit - self.price)\
                    + ' change.\'')
                self.item_stock = self.item_stock - 1
                self.current_deposit = 0
            else:
                self.current_deposit = 0
                self.item_stock = self.item_stock -1
                return 'Here is your ' + str(self.item) +'.'


class MissManners:
    """A container class that only forward messages that say please.

    >>> v = VendingMachine('teaspoon', 10)
    >>> v.restock(2)
    'Current teaspoon stock: 2'
    >>> m = MissManners(v)
    >>> m.ask('vend')
    'You must learn to say please first.'
    >>> m.ask('please vend')
    'You must deposit $10 more.'
    >>> m.ask('please deposit', 20)
    'Current balance: $20'
    >>> m.ask('now will you vend?')
    'You must learn to say please first.'
    >>> m.ask('please hand over a teaspoon')
    'Thanks for asking, but I know not how to hand over a teaspoon'
    >>> m.ask('please vend')
    'Here is your teaspoon and $10 change.'
    >>> really_fussy = MissManners(m)
    >>> really_fussy.ask('deposit', 10)
    'You must learn to say please first.'
    >>> really_fussy.ask('please deposit', 10)
    'Thanks for asking, but I know not how to deposit'
    >>> really_fussy.ask('please please deposit', 10)
    'Thanks for asking, but I know not how to please deposit'
    >>> really_fussy.ask('please ask', 'please deposit', 10)
    'Current balance: $10'
    >>> fussy_three = MissManners(3)
    >>> fussy_three.ask('add', 4)
    'You must learn to say please first.'
    >>> fussy_three.ask('please add', 4)
    'Thanks for asking, but I know not how to add'
    >>> fussy_three.ask('please __add__', 4)
    7
    """
    def __init__(self, obj):
        self.obj = obj
    def ask(self, request, *args):
        please = 'please '
        if 'please ' not in request:
            return 'You must learn to say please first.'
        if not hasattr(self.obj, request[len(please):]):
            return 'Thanks for asking, but I know not how to ' + request[len(please):]
        return getattr(self.obj, request[len(please):])(*args)

