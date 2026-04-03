"""
This exercise stub and the test suite contain several enumerated constants.

Enumerated constants can be done with a NAME assigned to an arbitrary,
but unique value. An integer is traditionally used because it’s memory
efficient.
It is a common practice to export both constants and functions that work with
those constants (ex. the constants in the os, subprocess and re modules).

You can learn more here: https://en.wikipedia.org/wiki/Enumerated_type
"""

# Possible sublist categories.
# Change the values as you see fit.
EQUAL = 1
SUBLIST = 2
SUPERLIST = 3
UNEQUAL = 4

def find_needle(needle, haystack):
    template = []
    for straw in range(len(haystack) - len(needle) + 1): # Added 1 to prevent fence post error
        for i in range(len(needle)):
            haystack_index = straw + i
            if needle[i] == haystack[haystack_index]:
                template.append(needle[i])
            else:
                template.clear()
                break
        if needle == template:
            found_it = True
            break

    if template == [] and template != needle:
        found_it = False

    return found_it
    


def sublist(list_one, list_two):
    equal = list_one == list_two
    sublist = find_needle(list_one, list_two) and not equal
    superlist = find_needle(list_two, list_one) and not equal and not sublist
    unequal = not equal and not sublist and not superlist

    return \
          equal * EQUAL \
        + sublist * SUBLIST \
        + superlist * SUPERLIST \
        + unequal * UNEQUAL

          
