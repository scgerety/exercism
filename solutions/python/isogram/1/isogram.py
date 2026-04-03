import re


def is_isogram(characters):
    """Determines whether a str string is an isogram.

    :param characters: str A set of characters whose letters may or
    may not be an isogram.
    :return: bool Returns True if the characters form an isogram and
    False if they do not.
    """
    if not isinstance(characters, str):
        raise ValueError('characters must be a string.')

    new_set = set()
    isogram = True
    char_list = re.findall(r'\w', characters.lower())
    
    for c in char_list:
        old_set = new_set.copy()
        new_set.add(c)
        if old_set == new_set:
            isogram = False
            break

    return isogram
