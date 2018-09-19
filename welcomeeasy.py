target = "welcome to code jam"
t = int(input())

for case in range(1, t + 1):
    line = input()
    count = 0
    js = [(0, 0)]
    while len(js) > 0:
        (j, c) = js.pop()
        for c in range(c, len(target)):
            while j < len(line):
                if line[j] == target[c]:
                    j += 1
                    js.append((j, c))
                    break
                j += 1
            else:
                break
        else:
            count += 1

    print("Case #{}: {:04}".format(case, count % 10000))
