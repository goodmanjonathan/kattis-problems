timeOfExplosion :: Int
timeOfExplosion = 3 * 60 + 30


questions :: Int -> IO [(Int, String)]
questions n = foldl (\acc' _ -> do
        acc <- acc'
        line <- getLine
        return (acc ++ [let (t:z:[]) = words line in (read t, z)])
    ) (return []) [1..n]


main :: IO ()
main = do
    k <- readLn
    n <- readLn
    pairs <- questions n

    print $ snd $ foldl (\(startTime, holder) (duration, correctness) ->
            if startTime + duration >= timeOfExplosion then
                (startTime + duration, holder)
            else
                if correctness == "T" then
                    (startTime + duration, (holder `mod` 8) + 1)
                else
                    (startTime + duration, holder)
        ) (0, k) pairs

