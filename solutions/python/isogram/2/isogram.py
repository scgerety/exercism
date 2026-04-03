import re

LETTERS_IN = r'\w'


def is_isogram(phrase):
    """Determines whether a str string is an isogram.

    :param characters: str A set of characters whose letters may or
    may not be an isogram.
    :return: bool Returns True if the characters form an isogram and
    False if they do not.
    """
    if not isinstance(phrase, str):
        raise ValueError('characters must be a string.')

    char_list = re.findall(LETTERS_IN, phrase.lower())
    return len(set(char_list)) == len(char_list)
