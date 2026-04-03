import re

CONSONANTS = "[bcdfghjklmnpqrstvwxyz]"
VOWELS = "[aeiou]"
SUFFIX = "ay"
RULE1 = f"(^{VOWELS}.*|xr.*|yt.*)()"
RULE2 = f"(^{CONSONANTS}+)(.*)"
RULE3 = f"(^{CONSONANTS}*qu)(.*)"
RULE4 = f"(^{CONSONANTS}+)(y.*)"
RULES = [RULE1, RULE3, RULE4, RULE2]


def translate(text: str) -> str:
    """Translates english word or phrase to Pig Latin.
    
    :param text: str English text to be translated
    :return: str Tranlsated text in Pig Latin
    """
    phrase = text.split(" ")
    pig_phrase = []
    for word in phrase:
        for check in [re.match(rule, word) for rule in RULES]:
            if check is not None:
                pig_word = check.group(2) + check.group(1) + SUFFIX
                break
        pig_phrase.append(pig_word)

    return " ".join(pig_phrase)
