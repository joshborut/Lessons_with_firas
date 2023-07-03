import random


def get_int(msg):
    temp = input(msg)
    if temp.isnumeric():
        return int(temp)
    else:
        print("Invalid guess. Please enter integer (e.g. 100)")
        return get_int(msg)


guess = 0
lowest = 0
highest = 1000
num_of_guesses = 0
answer = random.randint(lowest, highest)

# print("Please guess a number between {0} and {1}.".format(lowest, highest))
print(f"Please guess a number between {lowest} and {highest}.")

while guess != answer:
    # guess = int(input("Guess:\n"))
    guess = get_int("Please enter an integer:\n")
    num_of_guesses += 1

    if guess == answer:
        print("Well done! You guessed right.")
        print(f"{num_of_guesses} guesses were attempted.")
    else:
        if guess < answer:
            print("Please guess higher.")
        else:
            print("Please guess lower.")
