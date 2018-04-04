f 0 = do return ()
f n = do
    x <- readLn
    if x `rem` 2 == 0 then
        putStrLn (show x ++ " is even")
    else
        putStrLn (show x ++ " is odd")
    f (n - 1)
 
main = do
    n <- readLn
    f n
