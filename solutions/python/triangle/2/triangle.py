def unique_sides(sides: list[float]) -> int:
    return len(set(sides))


def is_triangle(sides: list[float]) -> bool:
    return all(side < sum(sides) - side for side in sides)


def equilateral(sides: list[float]) -> bool:
    return unique_sides(sides) == 1 and is_triangle(sides)


def isosceles(sides: list[float]) -> bool:
    return unique_sides(sides) <=2 and is_triangle(sides)


def scalene(sides: list[float]) -> bool:
    return unique_sides(sides) == 3 and is_triangle(sides)
