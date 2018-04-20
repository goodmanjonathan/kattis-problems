import Text.Printf

main :: IO ()
main = do
    line <- getLine
    if line == "0" then do
        return ()
    else do
        let (x1:y1:x2:y2:p:[]) = map read . words $ line :: [Double]
        let dist = ((abs (x1 - x2))** p + (abs (y1 - y2))** p)**(1.0/p)
        printf "%.10f\n" dist
        main
