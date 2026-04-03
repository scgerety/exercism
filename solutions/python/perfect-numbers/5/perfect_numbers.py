import operator
import math


def classify(number):
    """ A perfect number equals the sum of its positive divisors.
    :param number: int a positive integer
    :return: str the classification of the input integer
    """
    if not isinstance(number, int) or number < 1: 
        raise ValueError('Classification is only possible for positive integers.')
    
    if number > 1:
        sqrt_number = math.ceil(math.sqrt(number))
        factors = [1,]  # All numbers have 1 as a factor. Add here, skip in line 16
                        # to prevent counting number as its own factor.
        for candidate in range(2, sqrt_number):
            if number % candidate == 0:
                factors = factors + [candidate, number / candidate]

        aliquot = sum(set(factors))
    else:
        aliquot = 0

    comparisons = [
        operator.eq(aliquot, number),
        operator.lt(aliquot, number),
        operator.gt(aliquot, number)
    ]
    perfection_levels = ['perfect', 'deficient', 'abundant']

    for comp, level in zip(comparisons, perfection_levels):
        if comp:
            return level 
