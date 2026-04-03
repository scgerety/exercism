import itertools

def square_root(number):
    for root in itertools.count():
        if root ** 2 == number:
            return root
