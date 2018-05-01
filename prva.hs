import Data.List (transpose)

splitHash :: [String] -> String -> [String]
splitHash acc "" = acc
splitHash acc s =
    let (word, trailing) = span (/= '#') s in
    if null word then
        splitHash acc (dropWhile (== '#') trailing)
    else
        splitHash (word:acc) (dropWhile (== '#') trailing)

main :: IO ()
main = do
    _ <- getLine
    crossword <- getContents

    let acrossWords = filter (\a -> length a >= 2)
                        . concat
                        . map (splitHash [])
                        . lines
                        $ crossword
    let downWords = filter (\a -> length a >= 2)
                        . concat
                        . map (splitHash [])
                        . transpose
                        . lines
                        $ crossword

    putStrLn $ min (minimum acrossWords) (minimum downWords)
