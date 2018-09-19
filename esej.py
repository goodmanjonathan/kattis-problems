from random import randint
from itertools import product

word_list = map("".join, product(map(chr, xrange(ord('a'), ord('z') + 1)), repeat = 4))
[a, b] = map(int, raw_input().split())
print " ".join(map(lambda _: word_list.pop(), xrange(randint(max(a, b / 2), b))))
