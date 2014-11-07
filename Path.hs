module Path where
  import Data.List
  import Snip

  mkTree :: [[a]] -> Node a
  mkTree list = 
    let root = head $ head list
        children = head $ tail list
        rest = if length list < 3
                then []
                else tail $ tail list
    in znip root children rest
  
  calcSum :: Node Int -> Int
  calcSum (Node value c1 c2) = value + calcSum c1 + calcSum c2
  calcSum (EndNode value) = value
  calcSum n = 0

  findMaxSum :: Node Int -> Int
  findMaxSum (Node v c1 c2) = v + max (findMaxSum c1) (findMaxSum c2)
  findMaxSum (EndNode v) = 0
  findMaxSum (EmptyNode) = 0

  findPath :: Node Int -> [Int]
  findPath (Node v c1 c2) = v : max (findPath c1) (findPath c2)
  findPath (EndNode v) = [v]
  findPath (EmptyNode) = [0]

  p1 = mkTree [[0],[3,4],[5,6,7],[8,9,10,11]] --znip 0 [3,4] [[5,6,7],[8,9,0,1]]