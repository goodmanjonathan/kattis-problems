uniq :: String -> String
uniq = snd . foldr (\c (prev, acc) ->
        if c == prev then
            (c, acc)
        else
            (c, c:acc)
    ) (' ', "")

main :: IO ()
main = interact uniq
