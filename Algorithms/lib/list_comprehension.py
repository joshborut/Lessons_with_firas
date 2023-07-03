# Comprehensions do not function without for clauses
# square = []
# for i in range(10):
#     square.append(i**2)

square = [i**2 for i in range(10)]
print(square)

print(10) if True else print(20)

# comp = [(x, y) for x in [1, 2, 3] for y in [3, 1, 4] if x != y]

comp = []
for x in [1, 2, 3]:
    for y in [3, 1, 4]:
        if x != y:
            comp.append((x, y))

print(comp)

my_list = [1, 2, 3]
print([elem if elem % 2 > 0 else "" for elem in my_list])
print([elem for elem in my_list if elem % 2 > 0])



