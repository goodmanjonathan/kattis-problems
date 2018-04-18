n = int(input())

for _ in range(n):
    l1 = input()
    l2 = input()
    print(l1)
    print(l2)
    for t in zip(l1, l2):
        c1 = t[0]
        c2 = t[1]
        if c1 == c2:
            print(".", end="")
        else:
            print("*", end="")
    print()
