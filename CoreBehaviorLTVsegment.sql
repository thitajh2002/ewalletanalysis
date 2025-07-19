SELECT
    CASE
        WHEN LTV < 50000 THEN 'Low LTV'
        WHEN LTV BETWEEN 50000 AND 500000 THEN 'Medium LTV'
        ELSE 'High LTV'
    END AS LTV_Segment,
    COUNT(Customer_ID) AS NumberOfCustomers,
    ROUND(AVG(LTV), 2) AS Avg_LTV_In_Segment,
    ROUND(AVG(Total_Transactions), 2) AS Avg_Total_Transactions,
    ROUND(AVG(Avg_Transaction_Value), 2) AS Avg_Avg_Transaction_Value,
    ROUND(AVG(Total_Spent), 2) AS Avg_Total_Spent,
    ROUND(AVG(Active_Days), 2) AS Avg_Active_Days,
    ROUND(AVG(Last_Transaction_Days_Ago), 2) AS Avg_Last_Transaction_Days_Ago,
    ROUND(AVG(Loyalty_Points_Earned), 2) AS Avg_Loyalty_Points,
    ROUND(AVG(Referral_Count), 2) AS Avg_Referral_Count,
    ROUND(AVG(Cashback_Received), 2) AS Avg_Cashback_Received,
    ROUND(AVG(Support_Tickets_Raised), 2) AS Avg_Support_Tickets_Raised,
    ROUND(AVG(Issue_Resolution_Time), 2) AS Avg_Issue_Resolution_Time,
    ROUND(AVG(Customer_Satisfaction_Score), 2) AS Avg_Customer_Satisfaction_Score,
    GROUP_CONCAT(DISTINCT Preferred_Payment_Method) AS Popular_Payment_Methods_In_Segment,
    GROUP_CONCAT(DISTINCT App_Usage_Frequency) AS Popular_App_Usage_Frequency_In_Segment
FROM
    digital_wallet_ltv_dataset
GROUP BY
    LTV_Segment
ORDER BY
    CASE LTV_Segment
        WHEN 'Low LTV' THEN 1
        WHEN 'Medium LTV' THEN 2
        WHEN 'High LTV' THEN 3
    END;