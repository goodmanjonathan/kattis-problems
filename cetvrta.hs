intoTuple2 :: [a] -> (a, a)
intoTuple2 (a:b:[]) = (a, b)

main = do
    l1str <- getLine
    l2str <- getLine
    l3str <- getLine
    let l1 = intoTuple2 . map read . words $ l1str :: (Int, Int)
        l2 = intoTuple2 . map read . words $ l2str :: (Int, Int)
        l3 = intoTuple2 . map read . words $ l3str :: (Int, Int)
        vertices = l1 : l2 : [l3]
        ((a, b):[]) = [(a, b)
            | let (xs, ys) = unzip [l1, l2, l3]
            , a <- xs
            , b <- ys
            , not $ (a, b) `elem` vertices]
    putStrLn $ show a ++ " " ++ show b

