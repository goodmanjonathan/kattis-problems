import Data.Char
import Text.Printf

--toRevBinaryDigits' :: Int -> [Int]
--toRevBinaryDigits' 0 = []
--toRevBinaryDigits' n
--    | n `mod` 2 == 0 = 0 : toRevBinaryDigits' (n `div` 2)
--    | n `mod` 2 == 1 = 1 : toRevBinaryDigits' (n `div` 2)

--toRevBinaryDigits :: Int -> [Int]
--toRevBinaryDigits 0 = [0]
--toRevBinaryDigits n = toRevBinaryDigits' n

binaryToDecimal :: String -> Int
binaryToDecimal s = foldl (\acc (c, idx) ->
        acc + digitToInt c * 2^idx
    ) 0 (zip s [(length s - 1), (length s - 2)..0])

main :: IO ()
main = do
    n <- readLn :: IO Int
    print $ binaryToDecimal (reverse $ printf "%b" n)
