CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT name, size
  FROM dogs, sizes
  WHERE height > min AND height <= max;

-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_height AS
  SELECT child
  FROM parents, dogs
  WHERE parent = name
  ORDER BY -height;

-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT a.name AS sib1, b.name AS sib2, a.size AS size
  FROM parents AS p1, parents AS p2, size_of_dogs AS a, size_of_dogs AS b
  WHERE a.name < b.name AND a.name != b.name AND p1.child = a.name AND p2.child = b.name
  AND p1.parent = p2.parent AND a.size = b.size
  ORDER BY a.name;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT s.sib1 || " and " || s.sib2 || " are " || s.size || " siblings"
  FROM siblings as s;

-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks_helper(dogs, stack_height, last_height);

-- Add your INSERT INTOs here


CREATE TABLE stacks AS
  WITH sums(name, total, n, max) AS
  (SELECT name, height, 1, height
  FROM dogs UNION
  SELECT a.name || ", " || b.name, a.total + b.height, n+1, b.height
  FROM sums AS a, dogs AS b
  WHERE max < height AND n < 4)

  SELECT name, total FROM sums WHERE n = 4 AND total > 169 ORDER BY total;
