import Data.List

main = do
    line <- getLine
    if isInfixOf "ss" line
        then putStrLn "hiss"
        else putStrLn "no hiss"

