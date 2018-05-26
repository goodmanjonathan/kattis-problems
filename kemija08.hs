vowels :: [Char]
vowels = ['a', 'e', 'i', 'o', 'u']

decrypt :: String -> String
decrypt s = decrypt' s []
    where decrypt' [] acc = acc
          decrypt' (x:xs) acc
              | x `elem` vowels = decrypt' (drop 2 xs) (acc ++ [x])
              | otherwise = decrypt' xs (acc ++ [x])

main :: IO ()
main = do
    encrypted <- getLine
    putStrLn $ decrypt encrypted
