"""Lab 2: Lambda Expressions and Higher Order Functions"""

# Lambda Functions

def lambda_curry2(func):
    """
    Returns a Curried version of a two-argument function FUNC.
    >>> from operator import add
    >>> curried_add = lambda_curry2(add)
    >>> add_three = curried_add(3)
    >>> add_three(5)
    8
    """
    """
    def my_func(x):
        def my_2_func(y):
            return func(x, y)
        return my_2_func
    return my_func
    """

    return lambda x: lambda y: func(x, y)
