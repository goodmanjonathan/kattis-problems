import Data.List (sort)

main :: IO ()
main = do
    _ <- readLn :: IO Int
    players <- getContents

    let sorted = sort . lines $ players

    if sorted == lines players then
        putStrLn "INCREASING"
    else if reverse sorted == lines players then
        putStrLn "DECREASING"
    else
        putStrLn "NEITHER"
