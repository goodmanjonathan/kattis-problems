import Data.List (foldl')

f :: Int -> IO ()
f 0 = do return ()
f p = do
    line <- getLine
    let (k:n:[]) = map read . words $ line
    let s1 = n * (n + 1) `div` 2 -- sum of first n integers
    let s2 = n^2 -- sum of first n odd integers
    let s3 = n * (n + 1) -- sum of first n even integers (starting at 2)
                         -- (n * (n - 1); if starting at 0 like normal people)
    putStrLn $ show k ++ " " ++ show s1 ++ " " ++ show s2 ++ " " ++ show s3
    f (p - 1)

main :: IO ()
main = do
    p <- readLn
    f p
