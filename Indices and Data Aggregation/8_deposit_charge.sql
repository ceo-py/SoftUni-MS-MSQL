SELECT DepositGroup, MagicWandCreator, MIN(DepositCharge) AS DepositCharge
FROM WizzardDeposits
GROUP BY DepositGroup, MagicWandCreator
ORDER BY MagicWandCreator, DepositGroup