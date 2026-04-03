DROPLETS = {
    "Pling": (1, 3, 5, 7),
    "Plang": (2, 3, 6, 7),
    "Plong": (4, 5, 6, 7),
}


def convert(number: int) -> str:
    pling = 1 if number % 3 == 0 else 0
    plang = 2 if number % 5 == 0 else 0
    plong = 4 if number % 7 == 0 else 0

    drops = pling + plang + plong
    result = ""
    for sound, scores in DROPLETS.items():
        if drops in scores:
            result += sound
    if result == "":
        result = f"{number}"

    return result