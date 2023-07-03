message_1 = "Hello World"
message_2 = "Goodbye World"

# file = open('example.txt', 'a')
# print(message_1, file=file)
# file.close()

# a Open for writing at end (file created)
with open('example.txt', 'a') as f:
    print(message_1, file=f)

# a+ Open for reading and writing at end (file created)
with open('example.txt', 'a+') as f:
    print(message_2, file=f)
    f.seek(0)
    print(f.read())

# r Open for reading at start (file is not created)
with open('example.txt', 'r') as f:
    print(f.read())

#  r+ Open for reading and overrides writing at start (file is not created)
with open('example.txt', 'r+') as f:
    f.write("josh")
    f.seek(0)
    print(f.read())

# w truncates file to zero and open for writing (file created)
with open('example.txt', 'w') as f:
    print("this is a test", file=f)

# w+ truncates file to zero and open for reading and writing (file created)
with open('example.txt', 'w+') as f:
    print("this is a test", file=f)
    f.seek(0)
    print(f.read())

