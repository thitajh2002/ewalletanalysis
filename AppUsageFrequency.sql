SELECT
    App_Usage_Frequency,
    COUNT(Customer_ID) AS NumberOfCustomers,
    ROUND(AVG(Support_Tickets_Raised), 2) AS Avg_Support_Tickets_Raised,
    ROUND(AVG(Issue_Resolution_Time), 2) AS Avg_Issue_Resolution_Time,
    ROUND(AVG(Customer_Satisfaction_Score), 2) AS Avg_Customer_Satisfaction_Score,
    ROUND(AVG(LTV), 2) AS Avg_LTV
FROM
    digital_wallet_ltv_dataset
GROUP BY
    App_Usage_Frequency
ORDER BY
    Avg_Support_Tickets_Raised DESC;