teamInput :: Int -> Int -> IO [(String, String)]
teamInput total i
    | i == total + 1 = do return []
    | otherwise = do
        input <- getLine
        let (school:team:[]) = words input
        following <- teamInput total (i + 1)
        return ((school, team):following)

award :: [(String, String)] -> [String] -> IO ()
award [] _ = return ()
award ((school, team):following) winners = do
    if length winners == 12 then do
        return ()
    else if school `elem` winners then do
        award following winners
    else do
        putStrLn (school ++ " " ++ team)
        award following (school:winners)

main = do
    n <- readLn
    scoreboard <- teamInput n 1
    award scoreboard []
