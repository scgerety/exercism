"""Encode and decode Altbash Cipher"""
import string

ALPHABET = list(string.ascii_lowercase)
ALPHABET_BACKWARDS = [c for c in reversed(ALPHABET)]
PUNCTUATION = list(string.punctuation)
ENCODE_DICT = dict()
for plain, ciphered in zip(ALPHABET, ALPHABET_BACKWARDS):
    ENCODE_DICT[plain] = ciphered
for punct in PUNCTUATION:
    ENCODE_DICT[punct] = ""
ENCODE_DICT[" "] = ""
ENCODER = str.maketrans(ENCODE_DICT)


def encode(plain_text: str) -> str:
    """Encodes plain text into an Atbash Cipher.

    :param plain_text: str Text to be encoded.
    :return: str Encoded text.
    """
    ciphered_text = plain_text.lower().translate(ENCODER)
    ciphered_text = [c if i % 5 != 0 or i == 0 else f" {c}" for i, c in enumerate(ciphered_text)]
    ciphered_text = "".join(ciphered_text)

    return ciphered_text



def decode(ciphered_text: str) -> str:
    """Decodes ciphered text from Atbash Cipher. 

    :param ciphered_text: Text that has been encoded into Atbash
    cipher.
    :return: str Deciphered text with no spaces or punctuation
    """
    return ciphered_text.translate(ENCODER)
