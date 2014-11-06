data Node a = EndNode a | EmptyNode | EmptyNode1 | Node a (Node a) (Node a) deriving (Eq, Show)

l = [    [0]
    ,   [3,1]
    ,  [7,4,2]
    , [9,8,6,5]]

-- Node 0 
-- (Node 3 
--   (Node 7 
--     (EndNode 8) 
--     (EndNode 6)
--   ) 
--   (Node 4 
--     (EndNode 6) 
--     (EndNode 5)
--   )
-- ) 
-- (Node 1 
--   (Node 4 
--     (EndNode 8) 
--     (EndNode 6)
--   ) 
--   (Node 2 
--     (EndNode 6) 
--     (EndNode 5)
--   )
-- )


no :: [[a]] -> Node a
no ([]:[]:[]) = EmptyNode
no ([]:[]) = EmptyNode
no ([]) = EmptyNode
no (roots:[]) = EndNode $ head roots
no (roots:children:[]) = 
  let parent = head roots
      c1 = no [children]
      c2 = no $ [(tail children)]
  in Node parent (EndNode (head children)) (EndNode (head (tail children)) )--c1 c2
no (roots:children:r:re) = 
  let parent = head roots
      c1 = no children:r:re
  in EndNode c1
-- no (roots:children:rest) =
--   let parent = head roots
--       c1 = no (children:rest)
--       r = (tail (head rest)):(tail rest)
--       c2 = no $ (tail children):r
--   in Node parent c1 c2