# Rule 1: Constants are always ignored
# Rule 2: Slow terms/parts dominate the efficiency


# Efficiency = O(1) + O(n) = O(n) due to rule 2
def loop_print_1(n):  # O(n)
    for z in range(n):  # O(n)
        print(z)  # O(1)


# Efficiency = O(1) + O(n) + O(1) = O(n) due to rule 2
def loop_print_2(n):
    a = 5 * 10  # O(1)
    for b in range(a, n):  # O(n)
        print(b)  # O(1)


# Efficiency = O(n)*O(n) + O(1) = O(n^n) + O(1) = O(n^n)
def loop_print_3(n):
    for q in range(n):  # O(n)
        for r in range(q):  # O(n)
            print(r)  # O(1)

