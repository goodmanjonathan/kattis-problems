n = int(input())

for _ in range(n):
    (d, m) = map(int, input().split(' '))
    days = list(map(int, input().split(' ')))

    day_of_week = 0
    friday_13s = 0
    for month in range(m):
        for day in range(1, days[month] + 1):
            if day_of_week == 5 and day == 13:
                friday_13s += 1
            day_of_week = (day_of_week + 1) % 7

    print(friday_13s)

