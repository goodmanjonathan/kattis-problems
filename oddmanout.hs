import Data.List (sort, group)
import Control.Monad (mapM_)
import Text.Printf

findUniq :: (Eq a, Ord a) => [a] -> a
findUniq xs = head . head . filter (\g -> length g == 1) . group $ sort xs

main :: IO ()
main = do
    n <- readLn :: IO Int
    mapM_ (\test -> do
            _ <- readLn :: IO Int
            guests_ <- getLine
            let guests = map read . words $ guests_ :: [Int]
            let aloneGuest = findUniq guests
            printf "Case #%d: %d\n" test aloneGuest
        ) [1..n]

