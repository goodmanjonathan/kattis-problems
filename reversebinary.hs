import Data.List

toRevBinaryDigits' :: Int -> [Int]
toRevBinaryDigits' 0 = []
toRevBinaryDigits' n
    | n `mod` 2 == 0 = 0 : toRevBinaryDigits' (n `div` 2)
    | n `mod` 2 == 1 = 1 : toRevBinaryDigits' (n `div` 2)

toRevBinaryDigits :: Int -> [Int]
toRevBinaryDigits 0 = [0]
toRevBinaryDigits n = toRevBinaryDigits' n

toDecimal :: [Int] -> Int
toDecimal (x:[]) = x
toDecimal (x:xs) = x * 2^length xs + toDecimal xs

main :: IO ()
main = do
    n <- readLn
    print $ toDecimal (toRevBinaryDigits n)
