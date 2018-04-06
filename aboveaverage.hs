import Text.Printf

process :: Int -> IO ()
process 0 = do return ()
process n = do
    input <- getLine
    let (_:grades) = map (read :: String -> Double) (words input)
    let grades_len = fromIntegral $ length grades 
    let avg = sum grades / grades_len
    printf "%.3f%%\n" (100 * ((fromIntegral . length $ filter (> avg) grades) / grades_len))
    process (n - 1)

main = do
    c <- readLn
    process c
