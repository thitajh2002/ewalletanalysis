SELECT
    Location,
    Income_Level,
    COUNT(Customer_ID) AS NumberOfCustomers,
    ROUND(AVG(Loyalty_Points_Earned), 2) AS Avg_Loyalty_Points,
    ROUND(AVG(Referral_Count), 2) AS Avg_Referral_Count,
    ROUND(AVG(LTV), 2) AS Avg_LTV
FROM
    digital_wallet_ltv_dataset
GROUP BY
    Location, Income_Level
ORDER BY
    NumberOfCustomers DESC;