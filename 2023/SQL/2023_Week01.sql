SELECT * FROM preppin_data.dsb;

-- 1. Total values of transactions by each bank
SELECT 
SUBSTRING_INDEX(Transaction_code, '-', 1) AS Bank,
SUM(Value) AS Total
FROM dsb
GROUP BY SUBSTRING_INDEX(Transaction_code, '-', 1);

-- 2. Total values by Bank, Day of week and Type of Transaction (Online or In person)
SELECT
SUBSTRING_INDEX(Transaction_code, '-', 1) AS Bank,
CASE
	WHEN Online_or_InPerson = 1 THEN 'Online'
    WHEN Online_or_InPerson = 2 THEN 'InPerson'
END AS online_InPerson,
DAYNAME(STR_TO_DATE(Transaction_date, '%d-%m-%Y')) AS day_of_week,
SUM(Value) AS Total
FROM dsb
GROUP BY 1,2,3;

-- 3. Total values by bank and customer code
SELECT 
SUBSTRING_INDEX(Transaction_code, '-', 1) AS Bank,
Customer_code,
SUM(Value) AS Total
FROM dsb
GROUP BY SUBSTRING_INDEX(Transaction_code, '-', 1), Customer_code;


