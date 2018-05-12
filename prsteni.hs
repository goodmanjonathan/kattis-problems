import qualified Data.IntSet as IntSet

factors :: Int -> [Int]
factors n = 1 : foldr (\m acc ->
        if n `mod` m == 0 then
            m : acc
        else
            acc
     ) [n] [2..(n `div` 2)]

gcf :: Int -> Int -> Int
gcf x y =
    let set_x = IntSet.fromList (factors x)
        set_y = IntSet.fromList (factors y)
    in
        IntSet.findMax $ IntSet.intersection set_x set_y

main :: IO ()
main = do
    _ <- readLn :: IO Int
    line <- getLine

    let radii = map read . words $ line :: [Int]
    let first = head radii
    
    mapM_ (\r -> do
            let gcf' = gcf first r
            putStrLn $ show (first `div` gcf')
                ++ "/" ++ show (r `div` gcf')
        ) (tail radii)
