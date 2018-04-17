import Data.List (sort, nub)

inputs :: [Int] -> Int -> IO [Int]
inputs acc 0 = do return acc
inputs acc n = do
    i <- readLn
    inputs (i:acc) (n - 1)

main = do
    ins <- inputs [] 10
    let nums = map (\n -> n `mod` 42) ins
    print $ length . nub . sort $ nums
    
