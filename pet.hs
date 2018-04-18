import Data.List

main :: IO ()
main =
    interact (showWinner . winner . enumerate . map (sum . map read . words) . lines)
    where enumerate = zip [1..]
          winner = maximumBy (\(_, a) (_, b) -> compare a b)
          showWinner (id, score) = show id ++ " " ++ show score
