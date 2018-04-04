main = do
    input <- getLine
    let pieces = map read (words input)
        kings = 1 - pieces !! 0
        queens = 1 - pieces !! 1
        rooks = 2 - pieces !! 2
        bishops = 2 - pieces !! 3
        knights = 2 - pieces !! 4
        pawns = 8 - pieces !! 5 in
            putStrLn (unwords (map show [kings, queens, rooks, bishops, knights, pawns]))
