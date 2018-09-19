i = 1
while True:
    animals = []

    n = int(raw_input())
    if n == 0:
        break

    for _ in range(n):
        words = raw_input().split()
        ty = words[len(words) - 1].lower()
        for elem in animals:
            if elem[0] == ty:
                elem[1] += 1
                break
        else:
            animals.append([ty, 1])

    print "List " + str(i) + ":"
    animals.sort()
    for [ty, n] in animals:
        print ty + " | " + str(n)

    i += 1
