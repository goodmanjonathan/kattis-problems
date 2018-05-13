import qualified Data.Set as Set

date :: [String] -> Set.Set String -> Int -> Int -> Maybe Int
date [] _ _ _ = Nothing
date (x:xs) set p currentDate =
    let newSet = Set.insert x set in
        if Set.size newSet == p then
            Just currentDate
        else 
            date xs newSet p (currentDate + 1)

main :: IO ()
main = do
    line <- getLine
    let (p:n:[]) = map read . words $ line
    parts <- mapM (\_ -> getLine) [1..n]

    case date parts Set.empty p 1 of
        Just date -> print date
        Nothing -> putStrLn "paradox avoided"
