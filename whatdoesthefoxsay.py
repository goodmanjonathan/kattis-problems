n = int(input())
for _ in range(n):
    recording = input()
    sounds = []
    s = input()
    while s != "what does the fox say?":
        sounds.append(s.split(' ')[-1])
        s = input()
    
    fox_says = ""
    for sound in recording.split(' '):
        if sound not in sounds:
            fox_says += " " + sound
    print(fox_says.strip())
