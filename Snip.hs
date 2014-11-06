
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

  test3 = znip 1 [3,4] [[5,6,7],[8,9,10,11],[12,13,14,15,16]] == correct
  correct = Node 1 (Node 3 (Node 5 (Node 8 (EndNode 12) (EndNode 13)) (Node 9 (EndNode 13) (EndNode 14))) (Node 6 (Node 9 (EndNode 13) (EndNode 14)) (Node 10 (EndNode 14) (EndNode 15)))) (Node 4 (Node 6 (Node 9 (EndNode 13) (EndNode 14)) (Node 10 (EndNode 14) (EndNode 15))) (Node 7 (Node 10 (EndNode 14) (EndNode 15)) (Node 11 (EndNode 15) (EndNode 16))))

-- -- 1st
-- key = 1
-- values = [3,4]
-- rest = [[5,6,7],[8,9,10,11]]
-- v1 = 3
-- v2 = 4
-- -- 2nd
-- key = 4
-- values = [6,7]
-- rest = [[8,9,10,11]]
-- v1 = 6
-- v2 = 7
-- -- 3rd
-- key = 6
-- values = [8,9,10,11]
-- rest = []
-- v1 = 8
-- v2 = 9


--      1
--    [3,4]
--   [5,6,7]
-- [8,9,10,11]



-- znip (key:[]) (v1:v2:[]) rest = Node key left right where
--   left = znip [v1] (head rest) rest
--   right = znip [v2] (head rest) rest
-- znip (key:[]) (v1:v2:values) rest = Node key left right where
--   left = znip [v1] (head rest) rest
--   right = znip [v2] (head rest) rest

























-- snip :: [a] -> [a] -> [[a]] -> Node a
-- snip keys [] _ = 
--   if null keys 
--     then EmptyNode
--     else EndNode (head keys) where
-- -- snip keys values [] = Node value left right where
-- --   value = head keys
-- --   left = EndNode $ head values
-- --   right = EndNode . head $ tail values
-- snip keys values rest = 
--   let value = head keys
--       left = if null rest
--               then EndNode $ head values
--               else snip values (head rest) (tail rest)
--                 --Node value left right where
--       right = if null rest
--                 then EndNode . head $ tail values
--                 else snip (tail values) (tail $ head rest) (tail rest)
--   in Node value left right
--   -- value = head keys
--   -- left = snip values (head rest) (tail rest) --EndNode $ head values
--   -- right = snip (tail values) (tail $ head rest) (tail rest) --EndNode . head $ tail values

-- l = [    [0]
--     ,   [3,1]
--     ,  [7,4,2]
--     , [9,8,6,5]]

-- --    [0]
-- --   [3,4]
-- --  [5,6,7]
-- -- [8,9,0,1]

-- test = Node 0 (Node 3 (EndNode 5) (EndNode 6)) (Node 4 (EndNode 6) (EndNode 7))
-- test2 = Node 0 (Node 3 (Node 5 (EndNode 8) (EndNode 9)) (Node 6 (EndNode 9) (EndNode 0))) (Node 4 (Node 6 (EndNode 9) (EndNode 0)) (Node 7 (EndNode 0) (EndNode 1)))
