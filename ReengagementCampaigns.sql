SELECT
    Customer_ID,
    Age,
    Location,
    Income_Level,
    Total_Spent,
    Last_Transaction_Days_Ago,
    Active_Days,
    LTV,
    App_Usage_Frequency,
    Preferred_Payment_Method
FROM
    digital_wallet_ltv_dataset
WHERE
    Last_Transaction_Days_Ago > 30
    AND Active_Days > 90
    AND LTV > 500000
ORDER BY
    Last_Transaction_Days_Ago DESC;