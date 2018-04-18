n = int(input())

while n != -1:
    prev_time = 0
    total = 0
    for _ in range(n):
        (speed, time) = map(int, input().split(" "))
        total += (time - prev_time) * speed
        prev_time = time
    print(total, "miles")
    n = int(input())
