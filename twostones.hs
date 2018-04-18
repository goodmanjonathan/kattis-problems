main :: IO ()
main = do
    n <- readLn
    if n `mod` 2 == 0 then
        putStrLn "Bob"
    else
        putStrLn "Alice"
