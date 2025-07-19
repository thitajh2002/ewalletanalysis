SELECT
    Location,
    COUNT(Customer_ID) AS NumberOfCustomers,
    ROUND(AVG(Total_Transactions), 2) AS Avg_Total_Transactions,
    ROUND(AVG(Total_Spent), 2) AS Avg_Total_Spent,
    ROUND(AVG(LTV), 2) AS Avg_LTV,
    GROUP_CONCAT(DISTINCT Preferred_Payment_Method) AS Popular_Payment_Methods_In_Location,
    GROUP_CONCAT(DISTINCT App_Usage_Frequency) AS Popular_App_Usage_Frequency_In_Location
FROM digital_wallet_ltv_dataset
GROUP BY Location
ORDER BY NumberOfCustomers DESC;