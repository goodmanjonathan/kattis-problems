import qualified Data.Map.Strict as Map
import Data.Maybe

tests :: Int -> IO ()
tests 0 = return ()
tests n = do
    cases <- readLn
    city_tally <- foldl (\acc _ -> do
            city <- getLine
            acc_ <- acc
            return $ Map.alter (\mc -> Just ((fromMaybe 0 mc) + 1)) city acc_
        ) (return Map.empty) [cases, cases-1..1]
    print $ Map.size city_tally
    tests (n - 1)

main :: IO ()
main = do
    t <- readLn
    tests t
