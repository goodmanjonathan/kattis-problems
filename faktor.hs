main = do
    input <- getLine
    let (a:i:[]) = map (read :: String -> Double) (words input)
    print (ceiling (a * i) - floor a + 1)
