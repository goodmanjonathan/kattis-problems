import Data.Char (isLower, isUpper)
import Data.List (genericLength)
import Text.Printf

main :: IO ()
main = do
    line <- getLine
    let len = genericLength line :: Double
    let numWhitespace = genericLength (filter (=='_') line) :: Double
    let numLower = genericLength (filter isLower line) :: Double
    let numUpper = genericLength (filter isUpper line) :: Double
    let numSymbols = len - numWhitespace - numLower - numUpper
    printf "%.16f\n" (numWhitespace / len)
    printf "%.16f\n" (numLower / len)
    printf "%.16f\n" (numUpper / len)
    printf "%.16f\n" (numSymbols / len)
