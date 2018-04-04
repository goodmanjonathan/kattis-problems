r2 r1 s = round (2 * (s - r1 / 2))

main = do
    input <- getLine
    print (case (words input) of
            (r1:s:[]) -> r2 (read r1) (read s)
            otherwise -> error "wrong number of integers")
    
