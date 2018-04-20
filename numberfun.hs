type Op = Int

eval :: Double -> Double -> Double -> Op -> Int -> String
eval _ _ _ 0 0 = "Impossible"
eval a b c 0 1 = eval b a c 4 0
eval a b c o dir =
    let result = case o of
            4 -> a / b
            3 -> a * b
            2 -> a - b
            1 -> a + b 
    in
        if result == c then
            "Possible"
        else
            eval a b c (o - 1) dir

f :: Int -> IO ()
f 0 = return ()
f n = do
    line <- getLine
    let (a:b:c:[]) = map read . words $ line :: [Double]
    putStrLn (eval a b c 4 1)
    f (n - 1)

main :: IO ()
main = do
    n <- readLn
    f n
