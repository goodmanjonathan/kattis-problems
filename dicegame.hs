import Data.List (genericLength)

main :: IO ()
main = do
    gunnar <- getLine
    emma <- getLine
    let (ga1:gb1:ga2:gb2:[]) = map read . words $ gunnar
    let (ea1:eb1:ea2:eb2:[]) = map read . words $ emma
    let gunnarSums = [x + y | x <- [ga1..gb1], y <- [ga2..gb2]]
    let gunnarAvg = sum gunnarSums / genericLength gunnarSums
    let emmaSums = [x + y | x <- [ea1..eb1], y <- [ea2..eb2]]
    let emmaAvg = sum emmaSums / genericLength emmaSums
    
    if gunnarAvg > emmaAvg then do
        putStrLn "Gunnar"
    else if emmaAvg > gunnarAvg then do
        putStrLn "Emma"
    else
        putStrLn "Tie"
