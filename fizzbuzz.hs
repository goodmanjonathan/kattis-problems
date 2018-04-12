f x y n i
    | i > n = do return ()
    | otherwise = do
        if i `mod` x == 0 && i `mod` y == 0 then
            putStrLn "FizzBuzz"
        else if i `mod` x == 0 then
            putStrLn "Fizz"
        else if i `mod` y == 0 then
            putStrLn "Buzz"
        else
            print i
        f x y n (i + 1)

main = do
    line <- getLine
    let (x:y:n:[]) = map read $ words line :: [Int]
    f x y n 1
