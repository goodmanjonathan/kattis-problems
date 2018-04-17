update :: [[Int]] -> Int -> IO ()
update board move =

main = do
    r1 <- getLine
    r2 <- getLine
    r3 <- getLine
    r4 <- getLine
    move <- readLn
    update [r1, r2, r3, r4] (read move)
