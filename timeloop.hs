f 1 = putStrLn ((show 1) ++ " Abracadabra")
f n = do
    f (n - 1)
    putStrLn ((show n) ++ " Abracadabra")

main = do
    n <- readLn
    f n
    
