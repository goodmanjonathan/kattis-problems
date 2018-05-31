import Data.List (nub, sort)

cartesianProduct1 :: Eq a => [a] -> [(a, a)]
cartesianProduct1 xs = filter (uncurry (/=)) [(a, b) | a <- xs, b <- xs]

main :: IO ()
main = do
    input <- getContents
    mapM_ putStrLn (nub
                    . sort
                    . map (uncurry (++))
                    . cartesianProduct1
                    . words
                    $ input)
