import Snip
import Path

correct = Node 1 (Node 3 (Node 5 (Node 8 (EndNode 12) (EndNode 13)) (Node 9 (EndNode 13) (EndNode 14))) (Node 6 (Node 9 (EndNode 13) (EndNode 14)) (Node 10 (EndNode 14) (EndNode 15)))) (Node 4 (Node 6 (Node 9 (EndNode 13) (EndNode 14)) (Node 10 (EndNode 14) (EndNode 15))) (Node 7 (Node 10 (EndNode 14) (EndNode 15)) (Node 11 (EndNode 15) (EndNode 16))))
test2 = Node 0 (Node 3 (Node 5 (EndNode 8) (EndNode 9)) (Node 6 (EndNode 9) (EndNode 0))) (Node 4 (Node 6 (EndNode 9) (EndNode 0)) (Node 7 (EndNode 0) (EndNode 1)))

it :: String -> Bool -> IO ()
it description io = putStrLn ("  - " ++ description ++ ":  " ++ show io)

describe :: String -> IO () -> IO ()
describe name actions = putStrLn name >> actions

main :: IO ()
main = do
  describe "Snip.znip" $ do
    it "should build complex tree" $ do
      znip 1 [3,4] [[5,6,7],[8,9,10,11],[12,13,14,15,16]] == correct

    it "should build simple tree" $ do
      znip 0 [3,4] [[5,6,7],[8,9,0,1]] == test2

  describe "Path.mkTree" $ do
    it "should build a complex tree" $ do
      mkTree [[1],[3,4],[5,6,7],[8,9,10,11],[12,13,14,15,16]] == correct

    it "should build a simple tree" $ do
      mkTree [[0],[3,4],[5,6,7],[8,9,0,1]] == test2

  describe "Path.calcSum" $ do
    it "should return the value of an EndNode" $ do
      Path.calcSum (EndNode 1) == 1

    it "should return the sum of the node" $ do
      Path.calcSum (Node 1 (EndNode 1) EmptyNode) == 2

  describe "Path.findPath" $ do
    it "should return the highest-value path" $ do
      let path = (Node 1 (EndNode 1) (EndNode 2))
      Path.findPath path == [1,2]

    it "should select the path with the highest value" $ do
      --   [1]
      --  [1,2]
      -- [2,2,1]
      let path = Path.mkTree [[1],[1,2],[2,2,1]]
      Path.findPath path == [1,2,2]

    it "should select the path with the highest value (project euler)" $ do
      --    [3]
      --   [7,4]
      --  [2,4,6]
      -- [8,5,9,3]
      let path = Path.mkTree [[3],[7,4],[2,4,6],[8,5,9,3]]
      Path.findPath path == [3,7,4,9]