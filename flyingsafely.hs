import Control.Monad

main :: IO ()
main = do
    tests <- readLn
    mapM_ (\_ -> do
            line <- getLine
            let (cities:pilots:[]) = map read . words $ line
            mapM_ (\_ -> do _ <- getLine; return ()) [1..pilots]
            print (cities - 1)
        ) [1..tests]
