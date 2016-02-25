module PointInPolygon where

type Point = (Double, Double)

-- assume points appear in wind order
pointInPoly :: [Point] -> Point -> Bool
pointInPoly poly point = (odd . length) $ filter (cross point) segments where
  segments = zip poly $ tail poly ++ [head poly]

cross :: Point -> (Point, Point) -> Bool
cross (x,y) ((x1,y1), (x2,y2)) = (y1 - y) * (y2 - y) < 0 && x < k * x1 + (1 - k) * x2 where
  k = (y - y2) / (y1 - y2)
