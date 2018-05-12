main :: IO ()
main = do
    line <- getLine

    let (n:p:q:[]) = map read . words $ line
    let round = p + q
    let serveSet = (round `div` n) `mod` 2

    if serveSet == 0 then
        putStrLn "paul"
    else
        putStrLn "opponent"
