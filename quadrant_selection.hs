quad x y
    | x > 0 && y > 0 = 1
    | x > 0 && y < 0 = 4
    | x < 0 && y > 0 = 2
    | x < 0 && y < 0 = 3

main = do
    x <- readLn
    y <- readLn
    print (quad x y)
