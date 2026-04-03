"""Encode and decode Altbash Cipher"""
import string

SPACING = 5
ALPHABET = string.ascii_lowercase
ALPHABET_BACKWARDS = "".join(reversed(ALPHABET))
flip = dict()
for forward, backward in zip(ALPHABET, ALPHABET_BACKWARDS):
    flip[forward] = backward
for punct in string.punctuation:
    flip[punct] = ""
flip[" "] = ""
ATBASH_CIPHER = str.maketrans(flip)


def encode(plain_text: str) -> str:
    """Encodes plain text into an Atbash Cipher.

    :param plain_text: str Text to be encoded.
    :return: str Encoded text.
    """
    ciphered_text = plain_text.lower().translate(ATBASH_CIPHER)
    ciphered_text = " ".join(ciphered_text[index:index+SPACING] for index in range(0, len(ciphered_text), SPACING))

    return ciphered_text



def decode(ciphered_text: str) -> str:
    """Decodes ciphered text from Atbash Cipher. 

    :param ciphered_text: Text that has been encoded into Atbash
    cipher.
    :return: str Deciphered text with no spaces or punctuation
    """
    return ciphered_text.translate(ATBASH_CIPHER)
