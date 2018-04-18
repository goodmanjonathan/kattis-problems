main :: IO ()
main = do
    first <- getLine
    _ <- getContents
    let (_:carrots:[]) = map read . words $ first :: [Int]
    print carrots
