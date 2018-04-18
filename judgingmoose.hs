main :: IO ()
main = do
    line <- getLine
    let (l:r:[]) = map read . words $ line
    if l == 0 && r == 0 then
        putStrLn "Not a moose"
    else if l == r then
        putStrLn $ "Even " ++ show (2 * l)
    else
        let max_ = max l r in putStrLn $ "Odd " ++ show (2 * max_)
