"""Resistor color functions"""
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


def color_code(color: str) -> int:
    """Translates resistor color to resistance level.

    :param color: str A color that appears on a resistor.
    :return: int The resistance level.
    """
    return colors().index(color)


def colors() -> list[str]:
    """

    :return: list[str] A list of resistor colors in order.
    """
    return RESISTOR_COLORS
