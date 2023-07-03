parent = "python snake"
nums = "1,274;927:843.815 614"
separators = nums[1::4]
example_list = ["one", "two", "three"]
print("".join(example_list))
values = "".join([char if char not in separators
                 else " " for char in nums]).split()

# temp_list = []
# for char in nums:
#     if char not in separators:
#         temp_list.append(char)
#     else:
#         temp_list.append(" ")

temp = [let for let in nums]

print(parent[0:7:2])
print(nums[1::4])
print(values)

print(parent[-5])
print(parent[-5:])
print(parent[-1::-2])
print(parent[-2::-2])
print(parent[5-3])
print(parent[:])
print(parent[:5])
print(parent[4:2:-1])
print(parent[10:5:-1])
print(parent[5:10:-1])
print(parent[::-1])
print(parent[::1])
