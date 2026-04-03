def leap_year(year):
    century = year % 100 == 0
    return not year % 400 if century else not year % 4