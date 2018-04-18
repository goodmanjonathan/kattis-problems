main :: IO ()
main = do
    n <- readLn
    let num_squares_on_side = 2^n
    print $ ((num_squares_on_side + 1)^2)
