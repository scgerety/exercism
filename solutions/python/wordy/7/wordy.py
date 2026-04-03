import operator
import re

OPERATIONS = {
    "plus": operator.add,
    "minus": operator.sub,
    "multiplied": operator.mul,
    "divided": operator.truediv,
}
QUESTION = "What"
QUESTION_COMPONENTS = r"-?\w+"
FILLER = ["by", "is"]


def answer(question: str) -> int:
    """Answers a properly worded math question.

    :param question: str A properly worded math question
    :return: int The answer
    """
    q_list = re.findall(QUESTION_COMPONENTS, question)
    try:
        question, solution, *steps = [q for q in q_list if q not in FILLER]
    except:
        raise ValueError("syntax error")
    if any([op not in OPERATIONS for op in steps if op.isalpha()]) or question != QUESTION:
        raise ValueError("unknown operation")
    try:
        assert len(steps) % 2 == 0
        assert all([step.isalpha() for step in steps[::2]])
        assert all([step.lstrip("-").isnumeric() for step in steps[1::2]])
    except:
        raise ValueError("syntax error")

    solution = int(solution)
    operands = [int(num) for num in steps if num.lstrip("-").isnumeric()]
    operations = [OPERATIONS[op] for op in steps if op.isalpha()]
    equation = zip(operations, operands)

    for operation, operand in equation:
            solution = operation(solution, operand)

    return solution
