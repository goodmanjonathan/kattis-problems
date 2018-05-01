import Data.List (group, sort, sortBy, maximumBy)

main :: IO ()
main = do
    line <- getLine
    let (n:m:[]) = map read . words $ line :: [Int]
    let sumGroups = group . sort $ [d1 + d2 | d1 <- [1..n], d2 <- [1..m]]
    let orderedSumGroups = sortBy (\a b -> compare (length a) (length b)) sumGroups
    let longest = length . last $ orderedSumGroups
    let longests = map head . dropWhile (\l -> length l < longest) $ orderedSumGroups
    mapM_ print longests
