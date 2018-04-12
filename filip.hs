main = do
    line <- getLine
    let (a:b:[]) = map (read . reverse) $ words line :: [Int]
    print $ max a b
