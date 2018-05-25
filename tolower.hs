import Data.Char (isLower, toLower)

passTestCase :: [String] -> Bool
passTestCase cases = foldl (\acc s ->
        if not acc then
            acc
        else
            all isLower s
    ) True (map (\(head:tail) -> toLower head : tail) cases)

group :: Int -> [String] -> [[String]]
group _ [] = []
group n xs = take n xs : group n (drop n xs)

main :: IO ()
main = do
    first <- getLine
    testCases <- getContents

    let [p, t] = map read . words $ first
    let problems = group t (lines testCases)

    print $ length . filter (== True) . map passTestCase $ problems
