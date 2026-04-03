from string import ascii_uppercase

ALPHABET = ascii_uppercase


def rows(letter: str) -> list[str]:
    """From a letter input, the function will output a diamond with 
    equal letters in alphabetical order to the middle and reverse
    alphabetical order from the middle to the bottom.

    :param letter: str A string of a single character from A to Z
    :return: list[str] A list of strings that form a diamond when
    stacked on top of one another
    """
    left_pos = ALPHABET.index(letter)
    d_length = left_pos * 2 + 1
    
    diamond = []
    for line in range(left_pos + 1):
        layer = "".join([ALPHABET[line] if c == left_pos - line or c == left_pos + line else " " for c in range(d_length)])
        diamond.insert(line, layer)
        if line != left_pos:
            diamond.insert(len(diamond) - line, layer)

    return diamond
