UPDATE Actors
SET Rating = (select min(Rating) from Actors)
WHERE Rating > 90;