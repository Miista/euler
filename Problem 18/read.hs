import Path

stringToInt :: String -> Int
stringToInt s = read s :: Int

stringToIntList :: String -> [Int]
stringToIntList l = map stringToInt $ words l

main = do
  contents <- readFile "data.txt" --lines "1\n2 3"
  let literalTree = map stringToIntList $ lines contents
  let tree = Path.mkTree literalTree
  putStrLn . show $ Path.findMaxSum tree