def is_armstrong_number(number):
    digits = str(number)
    magnitude = len(digits)
    sum_pow_digits = sum(int(digit) ** magnitude for digit in digits)
    return sum_pow_digits == number