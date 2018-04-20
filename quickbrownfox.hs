import qualified Data.Map.Strict as Map
import Data.Char (isAlpha, toLower)
import Data.Maybe (fromJust)

f :: Int -> IO ()
f 0 = do return ()
f n = do
    line_ <- getLine
    let line = map toLower . (filter isAlpha) $ line_
    let tally = charTally line
    let missing = Map.size $ Map.filter (==0) tally
    if missing == 0 then do
        putStrLn "pangram"
    else do
        let chars = Map.foldrWithKey (\k v acc -> if v == 0 then k:acc else acc) "" tally
        putStrLn $ "missing " ++ chars
    f (n - 1)
    where charTally s = foldl insertInc (Map.fromList (zip ['a'..'z'] (replicate 26 0))) s
          insertInc map k = Map.insert k ((fromJust $ Map.lookup k map) + 1) map

main :: IO ()
main = do
    n <- readLn
    f n
