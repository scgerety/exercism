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
    "white",
]


def value(colors: list[str]) -> int:
    """Takes a list of resistor colors and outputs resistance values.
    
    :param colors: list[str] A list of resistor colors
    :return: int Resistance value
    """
    tens = RESISTOR_COLORS.index(colors[0]) * 10
    ones = RESISTOR_COLORS.index(colors[1])
    return tens + ones
