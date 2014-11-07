main = do
  -- contents <- readFile "data.txt"
  -- let l = lines contents
  -- let l1 = map words l
  -- let l2 = words $ head l
  --let l2 = map (\x -> read x :: [Char]) l
  -- putStrLn $ show (read (head l2) :: Int)

  -- let contents = "1\n2 3"
  -- let l = lines contents --"1 2 3"
  -- let w = words l
  -- let wm = map (\x -> read x :: Int)
  -- let l2 = read . head $ words l :: Int
  -- putStrLn $ show $ wm w

  contents <- readFile "data.txt" --lines "1\n2 3"
  let input = lines contents
  let literalTree = map (\x -> map (\y -> read y :: Int) (words x)) input
  putStrLn $ show literalTree

  -- input = words "1 2"
  -- map (\x -> read x :: Int) [input]
  -- map (\x -> map (\y -> read y :: Int) (words x)) input