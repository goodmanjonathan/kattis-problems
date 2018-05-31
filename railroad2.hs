main :: IO ()
main = do
    line <- getLine
    let [x, y] = map read . words $ line
    let connections = 4 * x + 3 * y
    if even connections then
        putStrLn "possible"
    else
        putStrLn "impossible"
