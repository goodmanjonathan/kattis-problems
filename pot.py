n = int(input())
ps = []

for _ in range(n):
    s = input()
    ps.append((int(s[:-1]), int(s[-1])))

sum = 0
for p in ps:
    sum += p[0] ** p[1]

print(sum)
