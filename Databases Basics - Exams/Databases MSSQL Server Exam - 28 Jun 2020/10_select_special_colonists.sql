WITH RankedColonists AS
(
  SELECT JobDuringJourney, FirstName + ' ' + LastName AS FullName,
    ROW_NUMBER() OVER (PARTITION BY JobDuringJourney ORDER BY BirthDate) AS JobRank
  FROM TravelCards
    JOIN Colonists ON TravelCards.ColonistId = Colonists.Id
)
SELECT JobDuringJourney, FullName, JobRank
FROM RankedColonists
WHERE JobRank = 2
