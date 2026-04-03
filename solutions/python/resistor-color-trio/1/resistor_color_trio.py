"""Read resistor labels"""
RESISTOR_COLORS = [
    "black",
    "brown",
    "red",
    "orange",
    "yellow",
    "green",
    "blue",
    "violet",
    "grey",
    "white"
]
BASE = 10
COMMA = 3
PREFIXES = {
    0: "",
    1: "kilo",
    2: "mega",
    3: "giga"
}


def label(colors: list[str]) -> int:
    """Translates color bands on a resistor to ohms.

    :param colors: list[str] Colors of each band from left to right
    :return: str Number of ohms, kiloohms, megaohms, or gigaohms
    """
    tens, ones, magnitude, *others = [RESISTOR_COLORS.index(color) for color in colors]
    tens = tens * BASE
    zeros = BASE ** magnitude
    ohms = (tens + ones) * zeros
    trailing_zeros = len([d for d in str(ohms) if d == "0"])
    comma_groups  = trailing_zeros // COMMA
    prefix = PREFIXES[comma_groups]
    result = ohms // (BASE ** (comma_groups * COMMA))

    return f"{result} {prefix}ohms"
