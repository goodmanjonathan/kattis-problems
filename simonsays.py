n = int(input())
for _ in range(n):
    (init, sep, tail) = input().partition("Simon says")
    if sep:
        print(tail)
