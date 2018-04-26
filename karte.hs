multiSplit :: (a -> Bool) -> [a] -> [[a]]
multiSplit _ [] sublist = sublist
multiSplit f (x:xs) sublist
    | f x = sublist ++ multiSplit f xs [x]
    | otherwise = multiSplit f xs (sublist ++ [x])

main = do
    line <- getLine
    let cards = groupBy (!! 0) . filter (not null) . multiSplit isAlpha line []
        [p, k, h, t] = map (\g -> 13 - length g) cards
    if length g > length $ nub g then
	putStrLn "GRESKA"
    else
        print 
