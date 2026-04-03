import re

CONSONANTS = "[bcdfghjklmnpqrstvwxyz]"
VOWELS = "[aeiou]"
SUFFIX = "ay"
RULE1 = f"(^{VOWELS}|xr|yt)"
RULE2 = f"(^{CONSONANTS}+)(.*)"
RULE3 = f"(^{CONSONANTS}*qu)(.*)"
RULE4 = f"(^{CONSONANTS}+)(y.*)"
RULES = [RULE1, RULE2, RULE3, RULE4]


def translate(text):
    """Translates english word or phrase to Pig Latin.
    
    :param text: str English text to be translated
    :return: str Tranlsated text in Pig Latin
    """
    phrase = text.split(" ")
    pig_phrase = []
    for word in phrase:
        rule1, rule2, rule3, rule4 = [re.match(rule, word) for rule in RULES]
        if rule1 is not None: 
            pig_word = word + SUFFIX
        elif rule3 is not None:
            pig_word = rule3.group(2) + rule3.group(1) + SUFFIX 
        elif rule4 is not None:
            pig_word = rule4.group(2) + rule4.group(1) + SUFFIX
        elif rule2 is not None:
            pig_word = rule2.group(2) + rule2.group(1) + SUFFIX
        pig_phrase.append(pig_word)
    return " ".join(pig_phrase)
