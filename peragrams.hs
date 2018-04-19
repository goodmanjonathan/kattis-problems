import Data.List
import qualified Data.Map.Lazy as Map

charTally :: String -> Map.Map Char Int
charTally s = foldl folder Map.empty s
    where folder map k = Map.insert k ((Map.findWithDefault 0 k map) + 1) map

isPalindrome :: String -> Bool
isPalindrome "" = True
isPalindrome (_:"") = True
isPalindrome (first:rest) =
    -- 1. is the first character equal to the last, and
    -- 2. is the middle of the string a palindrome
    first == last rest && (isPalindrome $ init rest)

isAnagramOf :: String -> String -> Bool
isAnagramOf anagram s =
    -- tally the number of occurences of each character in `anagram` and compare
    -- to that of `s`
    charTally anagram == charTally s

isPeragram :: String -> Bool
isPeragram s = not . Map.null $ Map.filter (\v -> v > 1 && isOdd) (charTally s)

minDeleteBecomePeragram :: String -> Int
minDeleteBecomePeragram s
    | isPalindrome s = 0
    | otherwise = error "non-palindromes are unimplemented"

main :: IO ()
main = interact (show . minDeleteBecomePeragram)
