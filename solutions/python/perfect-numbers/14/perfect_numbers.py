import math
import operator
from typing import Callable

COMPARISONS: dict[str, Callable[[int, int], bool]] = {
    'perfect': operator.eq,
    'deficient': operator.lt,
    'abundant': operator.gt,
}


def classify(number: int) -> str:
    """A perfect number equals the sum of its positive divisors.

    :param number: int a positive integer
    :return: str the classification of the input integer
    """
    if not isinstance(number, int) or number < 1: 
        raise ValueError('Classification is only possible for positive integers.')
    
    sqrt_number = math.ceil(math.sqrt(number))
    aliquot = 0
    for candidate in range(1, sqrt_number):
        divisor, remainder = divmod(number, candidate)
        if remainder == 0 and divisor != candidate:
            aliquot += divisor + candidate
    aliquot -= number

    for level, comp in COMPARISONS.items():
        if comp(aliquot, number):
            return level 
