f :: Int -> Int -> String -> Int
f idx count s
    | idx == length s = count
    | otherwise =
        if idx `mod` 3 == 0 && s !! idx /= 'P'
            || idx `mod` 3 == 1 && s !! idx /= 'E'
            || idx `mod` 3 == 2 && s !! idx /= 'R'
        then
            f (idx + 1) (count + 1) s
        else
            f (idx + 1) count s

main :: IO ()
main = do
    line <- getLine
    print $ f 0 0 line
