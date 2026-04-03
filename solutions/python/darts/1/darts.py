from math import sqrt

def score(x, y):
    """In a game of darts, this program gives a score for the coordinates 
    where a dart lands on a target.

    :param x: x coordinate for the point at which the dart lands.
    :param y: y coordinate for the point at which the dart lands.
    :return: int - Number of points earned from this throw.
    """
    
    # These constants are the radii of outer, middle, and inner circles.
    OUTER = 10
    MIDDLE = 5
    INNER = 1
    # These constants are the scores associated with outer, middle, and inner bands.
    SCORE_NONE = 0
    SCORE_OUTER = 1
    SCORE_MIDDLE = 5
    SCORE_INNER = 10

    distance = sqrt(pow(x, 2) + pow(y, 2)) # Distance from center
    
    if distance <= INNER:
        score = SCORE_INNER
    elif distance <= MIDDLE:
        score = SCORE_MIDDLE
    elif distance <= OUTER:
        score = SCORE_OUTER
    else:
        score = SCORE_NONE

    return score

