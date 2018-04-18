line = input()

ts = 0
cs = 0
gs = 0
for c in line:
    if c == 'T':
        ts += 1
    elif c == 'C':
        cs += 1
    elif c == 'G':
        gs += 1

ts2 = ts
cs2 = cs
gs2 = gs
fullsets = 0
while min(ts2, cs2, gs2) > 0:
    fullsets += 1
    ts2 -= 1
    cs2 -= 1
    gs2 -= 1

score = ts * ts + cs * cs + gs * gs + fullsets * 7
print(score)

