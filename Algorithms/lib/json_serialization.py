import json

# gameBoard = {'1': ' ', '2': ' ', '3': ' ',
#              '4': ' ', '5': ' ', '6': ' ',
#              '7': ' ', '8': ' ', '9': ' '}

# gameBoard = {}
# for i in range(9):
#     gameBoard[str(i)] = ''

gameBoard = {i: 'meow' for i in range(9)}

# for i in range(9):
#     with open('example.json', 'a') as new_file:
#         if i == 0:
#             new_file.write('{\n')
#             new_file.write(f'\"{i}\":\"\",\n')
#         elif i != 0 and i != 8:
#             new_file.write(f'\"{i}\":\"\",\n')
#         elif i == 8:
#             new_file.write(f'\"{i}\":\"\"\n')
#             new_file.write('}')

with open('example.json', "a+") as file:
    json.dump(gameBoard, file)
    file.seek(0)
    print(file.read())

with open('example.json', "w+") as file:
    json.dump(gameBoard, file)
    file.seek(0)
    data = json.load(file)
    print(data["7"])