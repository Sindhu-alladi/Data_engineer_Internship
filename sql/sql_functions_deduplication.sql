use messy_transformed_data;

SELECT Campaign_ID, COUNT(*) AS duplicate_count
FROM marketing_data
GROUP BY Campaign_ID HAVING COUNT(*) > 1;

SELECT * FROM (
SELECT *,
 ROW_NUMBER() OVER (
 PARTITION BY Campaign_ID, Start_Date
 ORDER BY Campaign_ID) AS rn FROM marketing_data)t
WHERE rn > 1;

Select * from marketing_data where campaign_id="CMP-00388";
Select * from marketing_data_cleaned where campaign_id="CMP-00388";

SELECT r.*
FROM marketing_data r
LEFT JOIN marketing_data_cleaned c ON r.campaign_id = c.campaign_id
WHERE c.campaign_id IS NULL;





