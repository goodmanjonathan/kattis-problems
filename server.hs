main :: IO ()
main = do
    l1 <- getLine
    l2 <- getLine
    let (_:t:[]) = map read . words $ l1
    let times = map read . words $ l2
    print $ snd $ foldl (\(totalTime, tasks) time ->
            if totalTime + time <= t then
                (totalTime + time, tasks + 1)
            else
                (totalTime + time, tasks)
        ) (0, 0) times
