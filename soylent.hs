energyPerBottle :: Double
energyPerBottle = 400.0

f :: Int -> IO ()
f 0 = do return ()
f t = do
    n <- readLn
    print $ ceiling (n / energyPerBottle)
    f (t - 1)

main :: IO ()
main = do
    t <- readLn
    f t    
