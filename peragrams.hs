import Data.List
import qualified Data.Map.Lazy as Map

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
    where charTally s = foldl folder Map.empty s
          folder map k = Map.insert k ((Map.findWithDefault 0 k map) + 1) map

isPeragram :: String -> Bool
isPeragram s =
    -- FIXME: generating all permutations is abysmally slow
    let palindromes = [p | p <- permutations s, isPalindrome p] in
        not . null $ palindromes

minDeleteBecomePeragram :: String -> Int
minDeleteBecomePeragram s
    | isPalindrome s = 0
    | otherwise = error "non-palindromes are unimplemented"

main :: IO ()
main = interact (show . minDeleteBecomePeragram)
