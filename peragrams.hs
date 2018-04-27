import Data.List
import qualified Data.Map.Lazy as Map

-- O(length s)
--isPalindrome :: String -> Bool
--isPalindrome "" = True
--isPalindrome (_:"") = True
--isPalindrome (first:rest) =
--    -- 1. is the first character equal to the last, and
--    -- 2. is the middle of the string a palindrome
--    first == last rest && (isPalindrome $ init rest)

-- O(length anagram + length s)
--isAnagramOf :: String -> String -> Bool
--isAnagramOf anagram s =
--    -- tally the number of occurences of each character in `anagram` and compare
--    -- to that of `s`
--    charTally anagram == charTally s

-- O(length s)
charTally :: String -> Map.Map Char Int
charTally s = foldl folder Map.empty s
    where folder map k = Map.insert k (Map.findWithDefault 0 k map + 1) map

-- O(1)
isPeragram :: Map.Map Char Int -> Bool
isPeragram m = Map.size (Map.filter (\v -> v `mod` 2 /= 0) m) <= 1

-- O(1)
minDeleteBecomePeragram :: Int -> Map.Map Char Int -> Int
minDeleteBecomePeragram num m
    | isPeragram m = num
    | otherwise =
        minDeleteBecomePeragram (num + 1)
            (Map.updateMin (\v -> Just $ subtract v 1) (Map.filter (\v -> v `mod` 2 /= 0) m))

main :: IO ()
main = do
    line <- getLine
    print $ minDeleteBecomePeragram 0 (charTally line)
