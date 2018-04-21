import Data.Char (isAlpha)
import Data.List (sortBy)

type Cup = (Int, String)

main :: IO ()
main = do
    n <- readLn
    cups <- foldr (\_ acc_ -> do
            acc <- acc_
            line <- getLine
            let cup = if isAlpha $ line !! 0 then do
                    -- <color> <radius>
                    let (color:radius_:[]) = words line
                    (read radius_, color)
                else do
                    -- <diameter> <color>
                    let (diameter_:color:[]) = words line
                    ((read diameter_) `div` 2, color)
            return (cup:acc)
        ) (return []) [1..n]

    mapM_ (\(_, color) -> putStrLn color) (sortBy (\(r1, _) (r2, _) -> compare r1 r2) cups)
