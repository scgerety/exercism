import math
import operator

COMPARISONS = {
    'perfect': operator.eq,
    'deficient': operator.lt,
    'abundant': operator.gt,
}


def classify(number):
    """A perfect number equals the sum of its positive divisors.
    :param number: int a positive integer
    :return: str the classification of the input integer
    """
    if not isinstance(number, int) or number < 1: 
        raise ValueError('Classification is only possible for positive integers.')
    
    if number > 1:
        sqrt_number = math.ceil(math.sqrt(number))
        factors = set()
        for candidate in range(1, sqrt_number):
            if number % candidate == 0:
                factors.update({candidate, number / candidate})
        aliquot = sum(factors) - number
    else:
        aliquot = 0

    for level, comp in COMPARISONS.items():
        if comp(aliquot, number):
            return level 
