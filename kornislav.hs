import Data.List (permutations)

area :: [Int] -> Int
area sides =
    if (sides !! 0 < sides !! 2) || (sides !! 1 > sides !! 3) then
        0
    else
        min (sides !! 0) (sides !! 2) * min (sides !! 1) (sides !! 3)

main :: IO ()
main = do
    line <- getLine
    let (a:b:c:d:[]) = map read . words $ line
    print $ maximum . map area . permutations $ [a, b, c, d]
