numDigits :: Integer -> Int
numDigits = length . show

main :: IO ()
main = do
    _ <- readLn :: IO Int
    estimates_ <- getContents
    let estimates = map read . lines $ estimates_ :: [Integer]
    mapM_ print (map numDigits estimates)
