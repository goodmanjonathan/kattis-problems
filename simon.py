n = int(input())
for _ in range(n):
    s = input().split(' ')
    if len(s) >= 2 and s[0] == 'simon' and s[1] == 'says':
        print(' '.join(s[2:]))
    else:
        print()
