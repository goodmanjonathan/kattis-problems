import Control.Monad
import Data.List

image :: IO [String]
image = do
    size <- getLine
    let (rows:cols:[]) = map read . words $ size
    mapM (\_ -> getLine) [1..rows]

main :: IO ()
main = do
    t <- readLn
    images <- mapM (\_ -> image) [1..t]
    mapM_ (\(im, idx) -> do
            let upsideDown = reverse im
            let andLeftRight = map reverse upsideDown
            putStrLn $ "Test " ++ show idx
            mapM_ putStrLn andLeftRight
        ) (zip images [1..])
