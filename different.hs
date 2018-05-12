diff :: [Int] -> [Int]
diff [] = []
diff (a:b:tail) = abs (a - b) : diff tail

main :: IO ()
main = do
    input <- getContents
    mapM_ print (diff . map read . words $ input)
