import Data.Char

main :: IO ()
main = do
    l <- readLn
    d <- readLn
    x <- readLn
    let n = minimum . filter (\n -> digitSum n == x) $ [l..d]
        m = maximum . filter (\n -> digitSum n == x) $ [d, d-1..l]
    print n
    print m
    where
        digitSum = sum . map digitToInt . show
        
