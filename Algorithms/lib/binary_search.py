import random


def print_target(aim):
    print(f"aim = {aim}")


def find_value(col, low, high, aim):  # O(log(n))
    while low <= high:  # O(log(n))
        mid = (low + high)//2  # O(1)

        if col[mid] == aim:  # O(1)
            return mid  # O(1)
        elif col[mid] < aim:  # O(1)
            low = mid + 1  # O(1)
            # return find_value(col, low, high, aim)
        else:  # O(1)
            high = mid - 1  # O(1)
            # return find_value(col, low, high, aim)
    return -1  # O(1)


lowest_index = 0
# num_to_find = 78
nums = []
nums_size = random.randint(10, 100)

for i in range(nums_size):
    last_num = random.randrange(1000) if len(nums) == 0 else nums[-1]

    # last_num = 0
    # if len(nums) == 0:
    #     last_num = random.randrange(1000)
    # else:
    #     last_num = nums[-1]

    random_value = random.randint(last_num, last_num + 100)
    nums.append(random_value)
    print(f"random value = {random_value}")

print(f"nums size = {len(nums)}")
num_to_find = nums[random.randrange(nums_size)]


print_target(num_to_find)

num_index = find_value(nums, lowest_index, nums_size - 1, num_to_find)

if num_index == -1:
    print("aim not in col")
else:
    print(f"The number {num_to_find} was found at index {num_index}")
