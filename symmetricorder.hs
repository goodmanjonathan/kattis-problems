import Control.Monad (mapM)
import Data.List (partition)

getSet :: IO [String]
getSet = do
    n <- readLn
    mapM (\_ -> getLine) [1..n]

printSet :: ([String], [String]) -> Int -> IO ()
printSet (evenIndices, oddIndices) n = do
    putStrLn $ "SET " ++ show n
    mapM_ putStrLn evenIndices
    mapM_ putStrLn (reverse oddIndices)

isEven :: Int -> Bool
isEven n = n `mod` 2 == 0

ioLoop :: Int -> IO ()
ioLoop n = do
    set <- getSet
    if null set then do
        return ()
    else do
        let (evens, odds) = partition (\(idx, _) -> isEven idx) (zip [0..] set)
        printSet (map (\(_, v) -> v) evens, map (\(_, v) -> v) odds) n
        ioLoop (n + 1)

main :: IO ()
main = ioLoop 1
