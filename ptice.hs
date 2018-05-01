main :: IO ()
main = do
    n <- readLn :: IO Int
    answers <- getLine
    let adrianSeq = cycle ['A', 'B', 'C']
    let brunoSeq = cycle ['B', 'A', 'B', 'C']
    let goranSeq = cycle ['C', 'C', 'A', 'A', 'B', 'B'] 
    let numsCorrect = map (\answerPair ->
            foldl (\acc (correct, guess) ->
                    if guess == correct then
                        acc + 1
                    else
                        acc
                ) 0 answerPair
        ) (map (\seq -> zip answers seq) [adrianSeq, brunoSeq, goranSeq])
    print $ maximum numsCorrect
    mapM_ putStrLn (
            map fst $ filter (\(_, numCorrect) -> numCorrect == maximum numsCorrect)
                (zip ["Adrian", "Bruno", "Goran"] numsCorrect)
        )
    
