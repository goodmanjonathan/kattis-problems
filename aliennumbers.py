x = int(raw_input())

for case in range(1, x + 1):
    [alien_num, source, target] = raw_input().split()
    source_map = {c:i for (i, c) in enumerate(source)}
    target_map = {i:c for (i, c) in enumerate(target)}
    source_radix = len(source)
    target_radix = len(target)
    num_len = len(alien_num)

    val = 0
    for (i, c) in enumerate(alien_num):
        val += source_map[c] * source_radix ** (num_len - i - 1)

    translated = "" 
    while val > 0:
        translated = target_map[val % target_radix] + translated
        val /= target_radix

    print "Case #" + str(case) + ": " + str(translated)
