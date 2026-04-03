SQUARES_ON_BOARD = 64

def square(number):
    if number <1 or number > SQUARES_ON_BOARD:
        raise ValueError("square must be between 1 and 64")

    return 2 ** (number - 1)


def total():
    grains = sum(square(number) for number in range(1, SQUARES_ON_BOARD + 1))
    return grains