import operator

def classify(number):
    """ A perfect number equals the sum of its positive divisors.
    :param number: int a positive integer
    :return: str the classification of the input integer
    """
    if not isinstance(number, int) or number < 1: 
        raise ValueError('Classification is only possible for positive integers.')
    
    if number > 1:
        aliquot = sum([candidate for candidate in range(1, number) if number % candidate == 0])
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
    
