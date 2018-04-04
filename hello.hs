main = do
    let x = 1
        y = 2
        z = case 3 of
                3 -> 3
                otherwise -> error "oh noes" in
        print (x + y)
