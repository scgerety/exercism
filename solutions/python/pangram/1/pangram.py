def is_pangram(sentence):
    """This function determines whether a sentence is a pangram or not.

    :param sentence: str A string to be evaluated as a pangram.
    :return: bool True indicates sentence is a pangram. False indicates
    it is not.
    """
    if not isinstance(sentence, str):
        raise ValueError('sentence must be a str to be a pangram.')

    alphabet = 'abcdefghijklmnopqrstuvwxyz'
    pangram = all(letter in sentence.lower() for letter in alphabet)
    
    return pangram
