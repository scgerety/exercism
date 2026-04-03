import operator
import re

OPERATIONS = {
    "plus": operator.add,
    "minus": operator.sub,
    "multiplied by": operator.mul,
    "divided by": operator.truediv,
}
QUESTION = "What is"
OPERATION_RE = "|".join(OPERATIONS)
DIGITS = r"-\d+|\d+"
WORDS = r"[a-zA-Z]+"
OPERATIONS_OR_QUESTION = set([op.split() for op in OPERATIONS]).union(QUESTION.split())
QUESTION_COMPONENTS = rf"{QUESTION}|{OPERATION_RE}|{DIGITS}"


def answer(question: str) -> int:
    """Answers a properly worded math question.

    :param question: str A properly worded math question
    :return: int The answer
    """
    q_list = re.findall(QUESTION_COMPONENTS, question)
    number_list = [number for index, number in enumerate(q_list) if index % 2 == 1]
    operation_list = [operation for index, operation in enumerate(q_list) if index % 2 == 0 and index != 0]
    operation_catcher = re.findall(WORDS, question)

    if any([operation not in OPERATIONS_OR_QUESTION for operation in operation_catcher]):
        raise ValueError("unknown operation")
    if any([re.search(OPERATION_RE, statement) is None for statement in operation_list]):
        raise ValueError("syntax error")
    if any([re.search(DIGITS, statement) is None for statement in number_list]):
        raise ValueError("syntax error")
    if len(operation_list) + 1 != len(number_list):
        raise ValueError("syntax error")
    
    for index, number in enumerate(number_list):
        number_list[index] = int(number)
    
    for index, operation in enumerate(operation_list):
        for name, op in OPERATIONS.items():
            if name == operation:
                operation_list[index] = op

    solution = number_list[0]
    number_list.pop(0)
    for index, op in enumerate(operation_list):
        solution = op(solution, number_list[index])

    return solution
