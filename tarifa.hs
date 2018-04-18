main :: IO ()
main = do
    x <- readLn
    n <- readLn
    result <- foldl (\acc _ -> do
            p <- readLn
            acc_ <- acc
            return $ x + (acc_ - p)
        ) (return x) [n, n-1..1]
    print result
