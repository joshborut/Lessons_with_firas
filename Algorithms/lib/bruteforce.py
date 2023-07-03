possible_keys = "1234567890!@#$%^&*()_+\"{}:?><|~"
# possible_keys = "12"
password_length = 32
list_of_possibilities = []
# my_name = "Josh"
# my_age = 15

for i in range(password_length):
    possibility = [j for j in possible_keys]
    print("i cycle: {}".format(i))
    i == 0 and print("Possibility is now {}".format(possibility))
    for k in range(i):
        print("k cycle: {}".format(k))
        possibility = [x + y for x in possibility for y in possible_keys]
        print("Possibility is now {}".format(possibility))
    list_of_possibilities.append(possibility)
    print("Above possibility is added to the list of possibilities.")

print(list_of_possibilities)

# possibility = []
# for i in possible_keys:
#     possibility.append(i)
#     print(possibility)
#
# for x in possible_keys:
#     print("x is {}".format(x))
#     for i in possible_keys:
#         print("i is {}".format(i))
#         possibility.append(x+i)
#         print(possibility)


