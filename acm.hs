import qualified Data.Map.Strict as Map

getLog :: IO [(Int, Char, String)]
getLog = getLog' []
    where getLog' acc = do
              line <- getLine
              let m = read . head . words $ line
              if m == (-1) then
                  return acc
              else do
                  let [problem, result] = tail . words $ line
                  getLog' (acc ++ [(m, problem !! 0, result)])

calcScore :: [(Int, Char, String)] -> (Int, Int)
calcScore table = calcScore' table (0, 0) Map.empty
    where calcScore' [] score _ = score
          calcScore' ((minute, problem, result):xs) (totalSolved, timeScore) attempts =
              if result == "right" then
                  case history of
                      Just (right, count)
                          | right -> calcScore' xs (totalSolved, timeScore) attempts
                          | otherwise -> calcScore' xs
                                                    (totalSolved + 1, timeScore + minute + count * 20)
                                                    (Map.insert problem (True, count + 1) attempts)
                      Nothing -> calcScore' xs
                                            (totalSolved + 1, timeScore + minute)
                                            (Map.insert problem (True, 1) attempts)
              else
                  let attemptInfo = case history of
                                        Just (right, count) -> (right, count + 1)
                                        Nothing -> (False, 1)
                  in calcScore' xs (totalSolved, timeScore) (Map.insert problem attemptInfo attempts)
              where history = Map.lookup problem attempts

main :: IO ()
main = do
    log <- getLog
    let (correct, time) = calcScore log
    putStrLn $ show correct ++ " " ++ show time
