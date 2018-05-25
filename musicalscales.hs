scales :: [(String, [String])]
scales =
    [("A",  ["A", "B", "C#", "D", "E", "F#", "G#", "A"])
    ,("A#", ["A#", "C", "D", "D#", "F", "G", "A", "A#"])
    ,("B",  ["B", "C#", "D#", "E", "F#", "G#", "A#", "B"])
    ,("C",  ["C", "D", "E", "F", "G", "A", "B", "C"])
    ,("C#", ["D#", "F", "F#", "G#", "A#", "C", "C#"])
    ,("D",  ["E", "F#", "G", "A", "B", "C#", "D"])
    ,("D#", ["F", "G", "G#", "A#", "C", "D", "D#"])
    ,("E",  ["E", "F#", "G#", "A", "B", "C#", "D#", "E"])
    ,("F",  ["F", "G", "A", "A#", "C", "D", "E", "F"])
    ,("F#", ["F#", "G#", "A#", "B", "C#", "D#", "F", "F#"])
    ,("G",  ["G", "A", "B", "C", "D", "E", "F#", "G"])
    ,("G#", ["G#", "A#", "C", "C#", "D#", "F", "G", "G#"])
    ]

main :: IO ()
main = do
    _ <- readLn :: IO Int
    song <- getLine

    let songNotes = words song
    let candidateScales = map fst
                          . filter (\(name, scale) -> all (`elem` scale) songNotes)
                          $ scales
    if null candidateScales then
        putStrLn "none"
    else do
        mapM_ (putStr . (++ " ")) candidateScales
        putStrLn ""
