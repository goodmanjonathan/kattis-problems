f 0 = return ()
f n = do
    f (n - 1)
    putStrLn ((show n) ++ " Abracadabra")

main = do
    n <- readLn
    f n
    
