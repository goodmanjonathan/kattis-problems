main :: IO ()
main = do
    line <- getLine
    let (hour:min:[]) = map read . words $ line
        (hour2, min2) = convert hour min
    putStrLn $ show hour2 ++ " " ++ show min2
    where convert h m = case (h, m) of
            (h, m) | m >= 45 -> (h, m - 45)
                   | h > 0 -> (h - 1, 60 - 45 + m)
                   | otherwise -> (23, 60 - 45 + m)
