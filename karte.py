import sys

def replicate(n, x):
    ret = []
    for _ in range(n):
        ret.append(x)
    return ret

line = input()
cards = replicate(53, False)

for i in range(0, len(line), 3):
    card_num = int(line[i+1:i+3])

    offset = 0
    if line[i] == 'P':
        pass
    elif line[i] == 'K':
        offset = 13
    elif line[i] == 'H':
        offset = 26
    else:
        offset = 39

    if cards[offset + card_num] is True:
        print("GRESKA")
        sys.exit(0)
    else:
        cards[offset + card_num] = True

suits = [cards[1:14], cards[14:27], cards[27:40], cards[40:53]]
for (idx, suit) in enumerate(suits):
    if idx != 0:
        print(end=" ")
    print(len(list(filter(lambda card: card is False, suit))), end="")
print()

