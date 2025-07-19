SELECT
    Income_Level,
    COUNT(Customer_ID) AS NumberOfCustomers,
    ROUND(AVG(Total_Transactions), 2) AS Avg_Total_Transactions,
    ROUND(AVG(Total_Spent), 2) AS Avg_Total_Spent,
    ROUND(AVG(LTV), 2) AS Avg_LTV,
    GROUP_CONCAT(DISTINCT Preferred_Payment_Method) AS Popular_Payment_Methods_In_Income_Group,
    GROUP_CONCAT(DISTINCT App_Usage_Frequency) AS Popular_App_Usage_Frequency_In_Income_Group
FROM digital_wallet_ltv_dataset
GROUP BY Income_Level
ORDER BY CASE Income_Level WHEN 'Low' THEN 1 WHEN 'Middle' THEN 2 WHEN 'High' THEN 3 ELSE 4 END;