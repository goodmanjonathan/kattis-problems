import Data.Char

input :: Int -> IO ()
input 0 = return ()
input n = do
    line <- getLine
    if line == "P=NP" then do
        putStrLn "skipped"
    else do
        let a = read . takeWhile isDigit $ line 
        let op = (dropWhile isDigit line) !! 0
        let b = read . dropWhile (not . isDigit) . dropWhile isDigit $ line
        if op == '+' then
            print $ a + b
        else
            print $ a - b
    input (n - 1)

main :: IO ()
main = do
    n <- readLn
    input n
