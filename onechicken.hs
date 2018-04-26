main :: IO ()
main = do
    line <- getLine
    let (n:m:[]) = map read . words $ line
    let diff = abs (n - m)
    let sign = signum (n - m)
    let pieceStr = if diff == 1 then
            " piece"
        else
            " pieces"

    if sign < 0 then
        putStrLn $ "Dr. Chaz will have " ++ show diff
            ++ pieceStr ++ " of chicken left over!"
    else
        putStrLn $ "Dr. Chaz needs " ++ show diff
            ++ " more" ++ pieceStr ++ " of chicken!"

