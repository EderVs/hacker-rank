len :: [a] -> Int
len lst = if null lst then 0 else 1 + len (tail lst)