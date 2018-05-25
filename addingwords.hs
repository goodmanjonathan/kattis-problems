import Data.List (partition)
import Data.Maybe (fromMaybe)

newtype Ident = Ident String
                deriving Eq
newtype Op = Op (Int -> Int -> Int)

data Command =
    Def Ident Int
    | Calc String [Ident] [Op]
    | Clear

type SymTable = [(Ident, Int)]

insertOrReplace :: Eq k => k -> v -> [(k, v)] -> [(k, v)]
insertOrReplace k v xs = insertOrReplace' 0 k xs
    where insertOrReplace' _ _ [] = (k, v) : xs
          insertOrReplace' idx target ((k, _):xxs) =
              if k == target then
                  take idx xs ++ [(k, v)] ++ drop (idx + 1) xs
              else
                  insertOrReplace' (idx + 1) target xxs

reverseLookup :: Eq v => v -> [(k, v)] -> Maybe k
reverseLookup _ [] = Nothing
reverseLookup target ((k, v):xs)
    | v == target = Just k
    | otherwise = reverseLookup target xs

parseSingle :: String -> Command
parseSingle comm =
    case keyword of
        "def" -> Def (Ident $ expr !! 0) (read $ expr !! 1)
        "calc" ->
            let isIdent (idx, _) = even idx
                (idents_, ops_) = partition isIdent (zip [0..] expr)
                idents = map (Ident . snd) idents_
                ops = map (\op -> case op of
                        "+" -> Op (+)
                        "-" -> Op (-)
                    ) . init . map snd $ ops_
            in Calc (unwords expr) idents ops
        "clear" -> Clear
    where (keyword:expr) = words comm

eval :: Command -> SymTable -> (SymTable, String)
eval comm symtable =
    case comm of
        Def binding val -> (insertOrReplace binding val symtable, "")
        Calc expr bindings ops ->
            let summation = foldl
                    (\sum (val, Op op) -> sum >>= (\sum -> val >>= (\val -> Just $ sum `op` val)))
                    (lookup (head bindings) symtable)
                    (zip (map (`lookup` symtable) . tail $ bindings) ops)
                result = fromMaybe "unknown" (summation >>= (\summation ->
                            reverseLookup summation symtable >>= (\(Ident binding) -> Just binding)
                        )
                    )
            in (symtable, expr ++ " " ++ result ++ "\n")
        Clear -> ([], "")

main :: IO ()
main = do
    program <- getContents

    let commands = map parseSingle . lines $ program
    mapM_ putStr . snd . foldr (\comm (symtable, outputs) ->
            let (newSymTable, output) = eval comm symtable in (newSymTable, output:outputs)
        ) ([], []) $ reverse commands
