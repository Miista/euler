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
  
  calcSum :: Node a -> Int
  calcSum n = 0
  
  p1 = mkTree [[0],[3,4],[5,6,7],[8,9,10,11]] --znip 0 [3,4] [[5,6,7],[8,9,0,1]]