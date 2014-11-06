module Snip (znip, Node (..)) where
  data Node a = EmptyNode | EndNode a | Node a (Node a) (Node a) deriving (Eq, Show)

  znip :: a -> [a] -> [[a]] -> Node a
  znip key [] [] = EndNode key
  znip key (v1:v2:_) [] = Node key (EndNode v1) (EndNode v2)
  znip key (v1:v2:values) rest = Node key left right where
    left = znip v1 (head rest) (tail rest)
    right = znip v2 (tail $ head rest) (tail $ rm rest)

  rm :: [[a]] -> [[a]]
  rm (h:[]) = (tail h) : []
  rm l = filter (not . null) $ (tail (head l)) : (rm (tail l))