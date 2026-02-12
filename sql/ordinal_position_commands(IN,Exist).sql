SELECT campaign_id, campaign_name, spend
FROM marketing_data
ORDER BY 2;

SELECT ORDINAL_POSITION,COLUMN_NAME,DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'messy_transformed_data'
AND TABLE_NAME = 'marketing_data_cleaned'
ORDER BY ORDINAL_POSITION;

-- IN
use messy_transformed_data;
SELECT * FROM marketing_data
WHERE campaign_id IN (SELECT campaign_id FROM marketing_data_cleaned);

--  NOT IN
SELECT * FROM marketing_data 
WHERE campaign_id NOT IN (SELECT campaign_id FROM marketing_data_cleaned);

-- EXISTS
SELECT * FROM marketing_data r
WHERE EXISTS (
SELECT 1
FROM marketing_data_cleaned c
WHERE r.campaign_id = c.campaign_id
);


-- NOT EXISTS
SELECT * FROM marketing_data r
WHERE NOT EXISTS (
SELECT 1
FROM marketing_data_cleaned c
WHERE r.campaign_id = c.campaign_id
);

