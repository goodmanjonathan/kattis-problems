import Data.List (intercalate)

friendDecision :: [Int] -> String
friendDecision (0:0:[]) = ""
friendDecision (x:y:[])
    | x + y == 13 = "Never speak again."
    | x == y      = "Undecided."
    | x > y       = "To the convention."
    | x < y       = "Left beehind."

main :: IO ()
main = interact (intercalate "\n" . map friendDecision . map (map read . words) . lines)
