f :: Int -> IO ()
f 0 = return ()
f n = do
    line <- getLine
    let (v0:theta_:x1:h1:h2:[]) = map read . words $ line
        theta = toRadians theta_
        t = x1 / (v0 * cos theta)
        yt = v0 * t * sin theta - 0.5 * 9.81 * t^2
        safe = yt >= h1 + 1 && yt <= h2 - 1 
    if safe then
        putStrLn "Safe"
    else
        putStrLn "Not Safe"
    f (n - 1)
    where toRadians deg = deg * pi / 180 

main :: IO ()
main = do
    n <- readLn
    f n
