import Snip

correct = Node 1 (Node 3 (Node 5 (Node 8 (EndNode 12) (EndNode 13)) (Node 9 (EndNode 13) (EndNode 14))) (Node 6 (Node 9 (EndNode 13) (EndNode 14)) (Node 10 (EndNode 14) (EndNode 15)))) (Node 4 (Node 6 (Node 9 (EndNode 13) (EndNode 14)) (Node 10 (EndNode 14) (EndNode 15))) (Node 7 (Node 10 (EndNode 14) (EndNode 15)) (Node 11 (EndNode 15) (EndNode 16))))
test2 = Node 0 (Node 3 (Node 5 (EndNode 8) (EndNode 9)) (Node 6 (EndNode 9) (EndNode 0))) (Node 4 (Node 6 (EndNode 9) (EndNode 0)) (Node 7 (EndNode 0) (EndNode 1)))

main :: IO ()
main = do
  putStr "Build complex tree:\t"
  putStrLn $ show (znip 1 [3,4] [[5,6,7],[8,9,10,11],[12,13,14,15,16]] == correct)
  putStr "Build simple tree:\t"
  putStrLn $ show (znip 0 [3,4] [[5,6,7],[8,9,0,1]] == test2)