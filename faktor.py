def up(i):
    if i // 1 == float(i):
        return i
    return i // 1 + 1

[a, i] = map(int, input().split())
print(up(a * i) - a + 1)
