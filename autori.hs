import Data.Char

main = do
    authors <- getLine
    putStrLn $ filter isUpper authors
