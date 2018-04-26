import Text.Printf

main :: IO ()
main = do
    r <- readLn :: IO Double
    printf "%.6f\n" (pi * r^2)
    printf "%.6f\n" (2 * r^2)
    
