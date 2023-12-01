map = {
    "one": 1,
    "two": 2,
    "three": 3,
    "four": 4,
    "five": 5,
    "six": 6,
    "seven": 7,
    "eight": 8,
    "nine": 9
}

keys = list(map.keys())

start = {"o", "t", "f", "f", "s", "e", "n"}

with open('input.txt') as fp:
    y = 0
    for line in fp:
        x = []
        for i in range(0, len(line)):
            c = line[i]
            if c.isnumeric():
                x.append(c)
            elif c in start:
                for key in keys:
                    s = line[i:i+len(key)]
                    if s == key:
                        x.append(str(map[s]))
                        i += len(key)
        
        val = int(x[0] + x[-1])
        y += val

    print(y)
