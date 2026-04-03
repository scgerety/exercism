def rebase(input_base: int, digits: list[int], output_base: int) -> list[int]:
    """This function takes input_base, digits, and output_base
    as input and outputs the digits according to the output_base.
    
    :param input_base: int a positive integer indicating the base of the
    number to be changed.
    :param digits: list[int] a list of integers, which indicate the digits of
    the number to be changed.
    :param output_base: int a positive integer, the target base of the output
    """
    if input_base < 2 or not isinstance(input_base, int):
        raise ValueError('input base must be >= 2')
    for digit in digits:
        if digit >= input_base or digit < 0:
            raise ValueError('all digits must satisfy 0 <= d < input base')
    if output_base <2 or not isinstance(output_base, int):
        raise ValueError('output base must be >= 2')
    
    # Initialize the variables. Digits should reverse for simplicity, 
    # otherwise, digit_index vs. pow(input_base, digit_index) becomes
    # convoluted.
    digits.reverse()
    new_digits = []
    number = 0
    
    # Thanks to catalyst2 for algorithm on converting base 16 to base 10
    # https://www.catalyst2.com/knowledgebase/dictionary/hexadecimal-base-16-numbers/
    for digit_index, digit in enumerate(digits):
        number += digit * pow(input_base, digit_index)
    
    while number >= 0:
        number, remainder = divmod(number, output_base)
        new_digits.insert(0, remainder)
        if number == 0:
            break

    return new_digits
