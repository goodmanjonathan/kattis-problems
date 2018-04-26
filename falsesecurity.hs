import Data.List
import Data.Maybe

codeMap :: [(Char, String)]
codeMap =
    [ ('A', ".-")
    , ('B', "-...")
    , ('C', "-.-.")
    , ('D', "-..")
    , ('E', ".")
    , ('F', "..-.")
    , ('G', "--.")
    , ('H', "....")
    , ('I', "..")
    , ('J', ".---")
    , ('K', "-.-")
    , ('L', ".-..")
    , ('M', "--")
    , ('N', "-.")
    , ('O', "---")
    , ('P', ".--.")
    , ('Q', "--.-")
    , ('R', ".-.")
    , ('S', "...")
    , ('T', "-")
    , ('U', "..-")
    , ('V', "...-")
    , ('W', ".--")
    , ('X', "-..-")
    , ('Y', "-.--")
    , ('Z', "--..")
    , ('_', "..--")
    , (',', ".-.-")
    , ('.', "---.")
    , ('?', "----")
    ]

reverseLookup :: Eq b => b -> [(a, b)] -> Maybe a
reverseLookup elem = foldl (\acc (k, v) -> 
        if v == elem then
            Just k
        else
            acc
    ) Nothing

convert :: String -> (String, [Int])
convert alpha = foldr (\c (morse, nums) ->
        let morseChar = fromJust $ lookup c codeMap in
            (morseChar ++ morse, (length morseChar) : nums)
    ) ("", []) alpha

reverseLengths :: (String, [Int]) -> (String, [Int])
reverseLengths (morse, lengths) = (morse, reverse lengths)

unconvert :: (String, [Int]) -> String
unconvert (morse, revLengths) = fst $ foldl (\(acc, morse) length_ ->
        let (morseChar, tail_) = splitAt length_ morse in
            ((fromJust $ reverseLookup morseChar codeMap) : acc, tail_)
    ) ("", morse) revLengths

codec :: String -> String
codec = unconvert . reverseLengths . convert

main :: IO ()
main = interact (intercalate "\n" . map (reverse . codec) . lines)

