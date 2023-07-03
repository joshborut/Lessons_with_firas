text = "hello world"
# (1) Lists keep duplicates
# (2) Lists are mutable objects; you can append items to a list
# (3) Lists are ordered
# (4) Lists are subscriptable
temp_list = [text[i:i + 2] for i in range(0, len(text), 2)]
temp_list_2 = []
counter = 2
for x in range(0, len(text), counter):
    temp_list_2.append(text[x:x + counter])

print(temp_list)
print(temp_list_2)

# (1) Sets are not subscriptable
# (2) Sets are only made up of unique items
# (3) Sets are not ordered
# (4) Sets are mutable; you can append items to a set
unique_text = set(text)
unique_text.add(2)
print(unique_text)

# (1) Tuples keep duplicates
# (2) Tuples are unmutable objects; you cannot append items to a tuple
# (3) Tuples are ordered
# (4) Tuples are subscriptable
tuple_example = (1, 5, 1, 2, 3, 4)
print(tuple_example)
print(tuple_example[1])
print(tuple_example[::-1])
