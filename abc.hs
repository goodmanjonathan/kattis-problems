import Data.List (sort)

main :: IO ()
main = do
    nums <- getLine
    order <- getLine

    let [a, b, c] = map show . sort $ (map read . words $ nums :: [Int])

    if order == "ABC" then
        putStrLn $ a ++ " " ++ b ++ " " ++ c
    else if order == "ACB" then
        putStrLn $ a ++ " " ++ c ++ " " ++ b
    else if order == "BAC" then
        putStrLn $ b ++ " " ++ a ++ " " ++ c
    else if order == "BCA" then
        putStrLn $ b ++ " " ++ c ++ " " ++ a
    else if order == "CAB" then
        putStrLn $ c ++ " " ++ a ++ " " ++ b
    else
        putStrLn $ c ++ " " ++ b ++ " " ++ a
