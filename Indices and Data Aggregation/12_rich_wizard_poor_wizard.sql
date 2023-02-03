SELECT SUM(a.DepositAmount - b.DepositAmount) AS SumDifference
FROM WizzardDeposits a
JOIN WizzardDeposits b
ON a.Id = b.Id - 1