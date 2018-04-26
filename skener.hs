import Control.Monad

image :: Int -> IO [String]
image rows = mapM (\_ -> getLine) [1..rows]

horizontalStretch :: Int -> [String] -> [String]
horizontalStretch x im = map (\row -> foldr (\c acc -> replicate x c ++ acc) "" row) im

verticalStretch :: Int -> [String] -> [String]
verticalStretch y im = foldr (\row acc -> replicate y row ++ acc) [] im

main :: IO ()
main = do
    line <- getLine
    let (r:c:zr:zc:[]) = map read . words $ line
    im <- image r
    mapM_ putStrLn (verticalStretch zr $ horizontalStretch zc im)
    
