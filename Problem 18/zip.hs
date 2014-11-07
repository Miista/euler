zips' :: [a] -> [a] -> [[a]]
zips' list a =
  let key = head list 
      v1 = head a
      v2 = head (tail a)
  in [[key,v1], [key,v2]] -- : zips (tail a) (tail b)
zips :: [a] -> [a] -> [[a]]
zips [] _ = []
zips a [] = []
zips a b = 
  let key = head a
      v1 = head b
      v2 = head (tail b)
  in [key, v1, v2] : zips (tail a) (tail b)

zipper :: [[a]] -> [[a]]
zipper [] = []
zipper (l1:l2:[]) = zips l1 l2
zipper (l1:l2:rest) = (zips l1 l2) ++ zipper (l2 : rest)

snips :: [a] -> [a] -> [[a]]
snips (key:restKeys) (v1:v2:[]) = [[key, v1],[key,v2]]
snips (key:restKeys) (v1:v2:restValues) = [[key, v1],[key,v2]] ++ snips restKeys (v2:restValues)

path :: [a] -> [a] -> [a]
path (key:restKeys) (v1:v2:restValues) = [key,v1] ++ path (v2:restValues) -- ++ (path (tail restValues))

l = [ [3]
    , [7,4]]  
--    , [2,4,6]]
--    , [8,5,9,3]]
l1 = [3]
l2 = [7,4]
l3 = [2,4,6]
l4 = [8,5,9,3]

--  [3,7,2,8]
--  [3,7,2,5]
--  [3,7,4,8]
--  [4,7,4,5]