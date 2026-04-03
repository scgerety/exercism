import re

CONSONANTS = "[bcdfghjklmnpqrstvwxyz]"
VOWELS = "[aeiou]"
SUFFIX = "ay"
RULE1 = f"^{VOWELS}|xr|yt"
RULE2 = f"^{CONSONANTS}+"
RULE3 = f"^{CONSONANTS}*qu"
RULE4 = f"^{CONSONANTS}+y"
RULES = [RULE1, RULE2, RULE3, RULE4]


def translate(text):
    phrase = text.split(" ")
    pig_phrase = []
    for word in phrase:
        rule1, rule2, rule3, rule4 = [re.match(rule, word) for rule in RULES]
        if rule1 is not None: 
            pig_word = word + SUFFIX
        elif rule3 is not None:
            start = rule3.span()[1]
            pig_word = word[start:] + rule3.group() + SUFFIX
        elif rule4 is not None:
            start = rule4.span()[1] - 1 # remove y from reach of span()
            pig_word = word[start:] + rule4.group()[:-1] + SUFFIX # [:-1] prevents y from being removed from group()
        elif rule2 is not None:
            start = rule2.span()[1]
            pig_word = word[start:] + rule2.group() + SUFFIX
        pig_phrase.append(pig_word)
    return " ".join(pig_phrase)
