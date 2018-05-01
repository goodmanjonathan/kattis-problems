import Text.Printf

main :: IO ()
main = do
    line <- getLine
    let (r:c:[]) = map read . words $ line :: [Double]
    let inner = pi * (r - c)**2 
    printf "%.9f\n" (100 * inner / (pi * r**2))
