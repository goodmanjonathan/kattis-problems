import Control.Monad (forM_)
import Data.List (elemIndex)


remove :: Int -> [a] -> [a]
remove idx xs = take idx xs ++ drop (idx + 1) xs


replace2With :: (a -> a -> a) -> Int -> [a] -> [a]
replace2With f i xs = take i xs ++ [f (xs !! i) (xs !! (i + 1))] ++ drop (i + 2) xs


numToStr :: Int -> String
numToStr n = case n of
    1 -> "+"
    2 -> "-"
    3 -> "*"
    4 -> "/"


eval :: Int -> Int -> Int -> Int -> IO ()
eval _ 0 _ _ = putStrLn "no solution"
eval n op1 0 op3 = eval n (op1 - 1) 4 op3
eval n op1 op2 0 = eval n op1 (op2 - 1) 4
eval n op1 op2 op3 =
    if reduce n [op1, op2, op3] [4, 4, 4, 4] == n then
        putStrLn ("4 " ++ numToStr op1 ++ " 4 " ++ numToStr op2 ++ " 4 "
                    ++ numToStr op3 ++ " 4 = " ++ show n)
    else
        eval n op1 op2 (op3 - 1)


reduce :: Int -> [Int] -> [Int] -> Int
reduce _ [] [x] = x
reduce n ops nums =
    let m = elemIndex 3 ops
        d = elemIndex 4 ops
        s = elemIndex 2 ops
        a = elemIndex 1 ops in
    case (d, m, s, a) of
        (Just d, _, _, _) ->
            reduce n (remove d ops) (replace2With div d nums)
        (_, Just m, _, _) ->
            reduce n (remove m ops) (replace2With (*) m nums)
        (_, _, Just s, _) ->
            reduce n (remove s ops) (replace2With (-) s nums)
        (_, _, _, Just a) ->
            reduce n (remove a ops) (replace2With (+) a nums)


main :: IO ()
main = do
    m <- readLn
    forM_ [1..m] $ \_ -> do
        n <- readLn
        eval n 4 4 4
