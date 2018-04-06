main = do
    _ <- readLn :: IO Int
    at_bats <- getLine
    let l = filter (/= -1) (map (read :: String -> Int) (words at_bats))
    print (fromIntegral (sum l) / fromIntegral (length l))
