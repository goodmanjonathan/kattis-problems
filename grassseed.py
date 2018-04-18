c = float(input())
l = int(input())
total = 0.0
for _ in range(l):
    [width, length] = map(float, input().split(" "))
    total += width * length * c
print("{:.7f}".format(total))
