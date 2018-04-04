toRadians :: (Floating a) => a -> a
toRadians deg = deg * pi / 180

main = do
    input <- getLine
    let (h:v:[]) = map (read :: String -> Double) (words input)
    print (ceiling (h / sin (toRadians v)))
