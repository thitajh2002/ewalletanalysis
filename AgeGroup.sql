SELECT
    CASE
		WHEN Age BETWEEN 0  AND 17 THEN 'Under 18'
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        WHEN Age BETWEEN 56 AND 65 THEN '56-65'
        ELSE '66+'
    END AS Age_Group,
    COUNT(Customer_ID) AS NumberOfCustomers,
    ROUND(AVG(Total_Transactions), 2) AS Avg_Total_Transactions,
    ROUND(AVG(Total_Spent), 2) AS Avg_Total_Spent,
    ROUND(AVG(LTV), 2) AS Avg_LTV,
    GROUP_CONCAT(DISTINCT Preferred_Payment_Method) AS Popular_Payment_Methods_In_Age_Group,
    GROUP_CONCAT(DISTINCT App_Usage_Frequency) AS Popular_App_Usage_Frequency_In_Age_Group
FROM digital_wallet_ltv_dataset
GROUP BY Age_Group
ORDER BY Age_Group;