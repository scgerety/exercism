def classify(number):
    """ A perfect number equals the sum of its positive divisors.

    :param number: int a positive integer
    :return: str the classification of the input integer
    """
    
    try:
        if type(number) is not int or number < 1: 
            raise ValueError('Classification is only possible for positive integers.')
    except ValueError:
        print('A ValueError occurred.')
        raise
    
    factors = list()
    if number > 1:
        factors = [candidate for candidate in range(1, number) if number % candidate == 0]

    aliquot = sum(factors)
    return \
          ('perfect' * (aliquot == number)) \
        + ('deficient' * (aliquot < number)) \
        + ('abundant' * (aliquot > number))
