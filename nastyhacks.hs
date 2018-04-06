advert 0 = do return ()
advert n = do
	input <- getLine
	let (r:e:c:[]) = map (read :: String -> Int) (words input)
	case compare (e - c) r of
		LT -> putStrLn "do not advertise"
		EQ -> putStrLn "does not matter"
		GT -> putStrLn "advertise"
	advert (n - 1)

main = do
	n <- readLn
	advert n
