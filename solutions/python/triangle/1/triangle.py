def equilateral(sides):
    a, b, c = sides
    triangle = all(side < sum(sides) - side for side in sides)
    if not triangle:
        return False
    return a == b and b == c


def isosceles(sides):
    a, b, c = sides
    triangle = all(side < (sum(sides) - side) for side in sides)
    if not triangle:
        return False
    return any([a == b, b == c, c == a])


def scalene(sides):
    a, b, c = sides
    triangle = all(side < sum(sides) - side for side in sides)
    if not triangle:
        return False
    return all([a != b, b != c, c != a])
