def response(hey_bob: str) -> str:
    hey_bob = hey_bob.strip()
    if not hey_bob:
        what_bob_says = "Fine. Be that way!"
    elif hey_bob.isupper() and hey_bob.endswith("?"):
        what_bob_says = "Calm down, I know what I'm doing!"
    elif hey_bob.isupper():
        what_bob_says = "Whoa, chill out!"
    elif hey_bob.endswith("?"):
        what_bob_says = "Sure."
    else:
        what_bob_says = "Whatever."

    return what_bob_says