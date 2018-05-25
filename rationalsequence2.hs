import Control.Monad (forM_)
import Data.Char (digitToInt)

-- Returns the prefix of `xs` before the first occurence of `elem` and
-- the suffix of `xs` after the first occurence of `elem`.
--
-- Throws if `elem` is not an element of `xs`.
split :: Eq a => a -> [a] -> ([a], [a])
split elem xs = (takeWhile (/= elem) xs, tail $ dropWhile (/= elem) xs)

-- Returns the node number `n` as a binary string, where the node number is
-- determined by breadth first traversal order, starting from 1.
buildBinaryString :: (Int, Int) -> String
buildBinaryString frac = buildBinaryString' frac []
    -- Ascend the binary tree, prepending a '0' to the accumulator if it's the left
    -- child of its parent, '1' if it's the right child or if it has no parent.
    --
    -- e.g. (p=2, q=1) => "11"
    where buildBinaryString' (p', q') acc
              | p' == 1 && q' == 1 = '1' : acc
              | otherwise =
                  if q >= 1 then
                      -- left child
                      buildBinaryString' (p, q) ('0' : acc)
                  else
                      -- right child
                      buildBinaryString' (p' - q', q') ('1' : acc)
                  where p = p'
                        q = q' - p

-- Converts a string of binary digits to a decimal integer.
--
-- e.g. "1011" => 11
binaryToDecimal :: String -> Int
binaryToDecimal binary = binaryToDecimal' binary 0 0
    where binaryToDecimal' [] _ acc = acc
          binaryToDecimal' (x:xs) idx acc =
              binaryToDecimal' xs (idx + 1) (digitToInt x + 2 * acc)

processInputs :: Int -> IO [(Int, Int)]
processInputs n = processInputs' n []
    where processInputs' 0 acc = return acc
          processInputs' n acc = do
              line <- getLine
              let [_, frac] = words line
              let (p_, q_) = split '/' frac
              let (p, q) = (read p_, read q_)
              processInputs' (n - 1) (acc ++ [(p, q)])

main :: IO ()
main = do
    p <- readLn
    inputs <- processInputs p

    forM_ (zip [1..] inputs) $ \(idx, input) ->
        putStrLn $ show idx
                   ++ " "
                   ++ show (binaryToDecimal $ buildBinaryString input)
