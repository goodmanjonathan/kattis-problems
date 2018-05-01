sodas :: Int -> Int -> Int -> Int
sodas n c acc
    | n < c = acc
    | otherwise = sodas (n `mod` c + n `div` c) c (n `div` c + acc)

main :: IO ()
main = do
    line <- getLine
    let (e:f:c:[]) = map read . words $ line
    print $ sodas (e + f) c 0
