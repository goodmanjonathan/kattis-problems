main :: IO ()
main = do
    l1 <- getLine
    l2 <- getLine
    if length l1 >= length l2 then do
        putStrLn "go"
    else do
        putStrLn "no"

