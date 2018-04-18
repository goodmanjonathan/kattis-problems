import math

[n, w, h] = map(int, input().split(" "))
for _ in range(n):
    l = int(input())
    if l <= math.sqrt(h * h + w * w):
        print("DA")
    else:
        print("NE")
