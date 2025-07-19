SELECT
    CASE
        WHEN LTV < 10000 THEN 'LTV_0-10K'
        WHEN LTV >= 10000 AND LTV < 50000 THEN 'LTV_10K-50K'
        WHEN LTV >= 50000 AND LTV < 200000 THEN 'LTV_50K-200K'
        WHEN LTV >= 200000 AND LTV < 500000 THEN 'LTV_200K-500K'
        WHEN LTV >= 500000 AND LTV < 1000000 THEN 'LTV_500K-1M'
        ELSE 'LTV_1M+'
    END AS LTV_Bucket,
    COUNT(Customer_ID) AS NumberOfCustomers,
    ROUND(MIN(LTV), 2) AS Min_LTV_In_Bucket,
    ROUND(MAX(LTV), 2) AS Max_LTV_In_Bucket,
    ROUND(AVG(LTV), 2) AS Avg_LTV_In_Bucket,
    ROUND(AVG(Total_Transactions), 2) AS Avg_Total_Transactions,
    ROUND(AVG(Total_Spent), 2) AS Avg_Total_Spent,
    ROUND(AVG(Avg_Transaction_Value), 2) AS Avg_Avg_Transaction_Value
FROM
    digital_wallet_ltv_dataset
GROUP BY
    LTV_Bucket
ORDER BY
    MIN(LTV);