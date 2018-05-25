import Text.Printf

main :: IO ()
main = do
    amountsStr <- getLine
    ratiosStr <- getLine

    let amounts = map read . words $ amountsStr :: [Double]
    let ratios = map read . words $ ratiosStr :: [Double]
    let smallestRatio = minimum . map (uncurry (/)) $ zip amounts ratios
    mapM_ (printf "%.6f " . (\(a, r) -> a - (r * smallestRatio))) (zip amounts ratios)
