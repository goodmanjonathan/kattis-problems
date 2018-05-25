main :: IO ()
main = do
    paragraph <- getContents

    let maxLength = maximum . map length . lines $ paragraph
    let score = sum
                . map (\line -> (maxLength - length line) ^ 2)
                . init
                . lines
                $ paragraph
    print score
