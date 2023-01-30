SELECT CountryName, CountryCode,
       CASE
           WHEN Currency = 'EUR' THEN 'Euro'
           ELSE 'Not Euro'
       END AS Currency
FROM Countries
ORDER BY CountryName;