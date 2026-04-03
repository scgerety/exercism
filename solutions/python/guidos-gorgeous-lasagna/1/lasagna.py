"""Functions used in preparing Guido's gorgeous lasagna.

Learn about Guido, the creator of the Python language:
https://en.wikipedia.org/wiki/Guido_van_Rossum

This is a module docstring, used to describe the functionality
of a module and its functions and/or classes.
"""


#TODO: define the 'EXPECTED_BAKE_TIME' constant.
EXPECTED_BAKE_TIME = 40
PREPARATION_TIME = 2
#TODO: Remove 'pass' and complete the 'bake_time_remaining()' function below.
def bake_time_remaining(elapsed_bake_time):
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - remaining bake time (in minutes) derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """

    return EXPECTED_BAKE_TIME - elapsed_bake_time


#TODO: Define the 'preparation_time_in_minutes()' function below.
# You might also consider using 'PREPARATION_TIME' here, if you have it defined.

def preparation_time_in_minutes(number_of_layers):
    """Calculate the time to prepare before baking.

    :param number_of_layers: int - number of layers of lasagna
    :return: int - preparation time (in minutes) derived from `PREPARATION_TIME`

    Function that takes a number of layers of lasagna and outputs total preparation 
    time before baking based on `PREPARATION_TIME`.
    """
    return PREPARATION_TIME * number_of_layers 

#TODO: define the 'elapsed_time_in_minutes()' function below.
# Remember to add a docstring (you can copy and then alter the one from bake_time_remaining.)
def elapsed_time_in_minutes(number_of_layers, elapsed_bake_time):
    """Calculate the time elapsed in minutes
    :param number_of_layers: int - number of layers of lasagna added
    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - elapsed bake time (in minutes) derived from result of 
    `preparation_time_in_minutes()` and input.

    Function that takes the number of layers added to the lasagna and actual minutes   
    the lasagna has been in the oven and returns the time elapsed based on the 
    function preparation_time_in_minutes plus the elapsed bake time.
    """
    return preparation_time_in_minutes(number_of_layers) + elapsed_bake_time