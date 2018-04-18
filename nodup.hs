import Data.List

main :: IO ()
main = do
    line <- getLine
    let repeats = (length . nub . words $ line) /= (length . words $ line)
    if not repeats then
        putStrLn "yes"
    else
        putStrLn "no"
