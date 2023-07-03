import random

all_exits = ["north", "south", "east", "west", "up", "down", "left", "right"]
opposites = {"north": "south", "east": "west", "up": "down", "left": "right",
             "south": "north", "west": "east", "down": "up", "right": "left"}
ran_index = random.randint(0, len(all_exits) - 1)
correct_exit = all_exits[ran_index]
exit_choice = ""
attempt_counter = 0


def print_first_letter():
    print(f"Exit starts with {correct_exit[0]}.")


def print_opposite():
    print(f"Opposite of {opposites[correct_exit]}")


def print_backwards():
    print(f"{correct_exit[::-1]} backwards")


def print_cardinal():
    print("The correct exit is a cardinal direction.") if correct_exit in all_exits[:4] \
        else print("The correct exit is body relative direction.")


hint_list = [print_first_letter, print_opposite, print_backwards, print_cardinal]

print("You are stuck in a haunted house with one exit. If you don't escape you are in big trouble.")

while exit_choice.lower() != correct_exit:
    if attempt_counter >= 3 and hint_list:
        hint_choice = input("Would you like a hint? (yes/no)\n")
        # Come up with hint system for multiple hints
        if hint_choice.lower() == "yes":
            hint_function = random.choice(hint_list)
            hint_function()
            attempt_counter = 0
            hint_list.remove(hint_function)
            print(f"Hints Remaining: {len(hint_list)}")

    exit_choice = input("Choose your exit (north/south/east/west/up/down/left/right):\n")
    if exit_choice.lower() == "quit":
        print("Game over.")
        break
    attempt_counter += 1
else:
    print("You have escaped.")
