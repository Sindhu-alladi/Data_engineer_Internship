create database messy_transformed_data;
use messy_transformed_data;

DESCRIBE marketing_data;
select * from marketing_data;


-- STEP 1: CAMPAIGN ID – TRIM SPACES
SELECT
  Campaign_ID AS raw_campaign_id,
  LTRIM(RTRIM(Campaign_ID)) AS cleaned_campaign_id
FROM marketing_data;

-- STEP 2: CAMPAIGN NAME – TRIM + LOWER
SELECT
  Campaign_Name AS raw_campaign_name,
  LOWER(TRIM(Campaign_Name)) AS cleaned_campaign_name
FROM marketing_data;


-- STEP 3: CHANNEL – TRIM + UPPER
SELECT
  Channel AS raw_channel,
  UPPER (TRIM(Channel)) AS cleaned_channel
FROM marketing_data;


-- STEP 4: ACTIVE – RAW VALUES CHECK
SELECT DISTINCT Active
FROM marketing_data;
 -- ----
 SELECT
  REPLACE(
    REPLACE(
      REPLACE(
        REPLACE(UPPER(LTRIM(RTRIM(Active))), 'YES', 'ACTIVE'),
      'Y', 'ACTIVE'),
    'TRUE', 'ACTIVE'),
  '1', 'ACTIVE') AS active_status
FROM marketing_data;

SELECT
  Active AS raw_active,
  REPLACE(
    REPLACE(
      REPLACE(
        REPLACE(UPPER(LTRIM(RTRIM(Active))), 'NO', 'INACTIVE'),
      'N$', 'INACTIVE'),
    'FALSE', 'INACTIVE'),
  '0', 'INACTIVE') AS active_status_after_replace
FROM marketing_data;

-- STEP 5: ACTIVE – STANDARDIZE USING CASE
SELECT
  Active AS raw_active,
  CASE
    WHEN UPPER(LTRIM(RTRIM(Active))) IN ('Y','YES','TRUE','1')
      THEN 'ACTIVE'
    WHEN UPPER(LTRIM(RTRIM(Active))) IN ('N','NO','FALSE','0')
      THEN 'INACTIVE'
    ELSE 'UNKNOWN'
  END AS cleaned_active
FROM marketing_data;

-- STEP 6: IMPRESSIONS – TEXT → INT 
SELECT
  Impressions AS raw_impressions,
  CAST(
    CAST(NULLIF((Impressions), '') AS DECIMAL(10,2))
    AS SIGNED
  ) AS cleaned_impressions
FROM marketing_data;

-- STEP 7: CLICKS – TEXT → INT 

SELECT
  Clicks AS raw_clicks,
  CAST(
    CAST(NULLIF((Clicks), '') AS DECIMAL(10,0))
    AS SIGNED
  ) AS cleaned_clicks
FROM marketing_data;



-- STEP 8: CONVERSIONS – TEXT → INT 
SELECT
  Conversions AS raw_conversions,
  CAST(
    CAST(NULLIF((Conversions), '') AS DECIMAL(10,0))
    AS SIGNED
  ) AS cleaned_conversions
FROM marketing_data;



-- STEP 9: SPEND – REMOVE $ + DECIMAL

SELECT
  Spend AS raw_spend,
  CAST(
    NULLIF(REPLACE(TRIM(Spend), '$', ''), '')
    AS DECIMAL(10,2)
  ) AS cleaned_spend
FROM marketing_data;

-- STEP 10: START DATE – HANDLE MIXED FORMATS

SELECT
  Start_Date AS raw_start_date,
  CASE
    WHEN Start_Date LIKE '%/%'
      THEN STR_TO_DATE(Start_Date, '%d/%m/%Y')
    ELSE CAST(Start_Date AS DATE)
  END AS cleaned_start_date
FROM marketing_data;


CREATE TABLE marketing_data_cleaned AS
SELECT DISTINCT
    -- Campaign ID
    LTRIM(RTRIM(Campaign_ID)) AS campaign_id,

    -- Campaign Name
    LOWER(LTRIM(RTRIM(Campaign_Name))) AS campaign_name,

    -- Start Date (HANDLE MIXED FORMATS)
    CASE
        WHEN Start_Date LIKE '%/%'
            THEN STR_TO_DATE(Start_Date, '%d/%m/%Y')
        ELSE CAST(Start_Date AS DATE)
    END AS start_date,

    -- End Date (HANDLE MIXED FORMATS)
    CASE
        WHEN End_Date LIKE '%/%'
            THEN STR_TO_DATE(End_Date, '%d/%m/%Y')
        ELSE CAST(End_Date AS DATE)
    END AS end_date,

    -- Channel
    UPPER(LTRIM(RTRIM(Channel))) AS channel,

    -- Impressions
    CAST(
        CAST(NULLIF((Impressions), '') AS DECIMAL(10,2))
        AS SIGNED
    ) AS impressions,

    -- Clicks
    CAST(
        CAST(NULLIF((Clicks), '') AS DECIMAL(10,2))
        AS SIGNED
    ) AS clicks,

    -- Spend
    CAST(
        NULLIF(REPLACE(LTRIM(RTRIM(Spend)), '$', ''), '')
        AS DECIMAL(10,2)
    ) AS spend,

    -- Conversions
    CAST(
        CAST(NULLIF((Conversions), '') AS DECIMAL(10,2))
        AS SIGNED
    ) AS conversions,

    -- Active status
    CASE
        WHEN UPPER(LTRIM(RTRIM(Active))) IN ('Y', 'YES', 'TRUE', '1')
            THEN 'ACTIVE'
        WHEN UPPER(LTRIM(RTRIM(Active))) IN ('N', 'NO', 'FALSE', '0')
            THEN 'INACTIVE'
        ELSE 'UNKNOWN'
    END AS active,

    -- Campaign tag
    LTRIM(RTRIM(Campaign_Tag)) AS campaign_tag

FROM marketing_data;



select * from marketing_data_cleaned;

select count(*) from marketing_data_cleaned;

select count(*) from marketing_data;


SELECT
    Campaign_ID,
    Campaign_Name,
    COUNT(*) AS duplicate_count
FROM marketing_data
GROUP BY
    Campaign_ID,
    Campaign_Name
HAVING COUNT(*) > 1;

SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY Campaign_ID, Start_Date
               ORDER BY Campaign_ID
           ) AS rn
    FROM marketing_data
) t
WHERE rn > 1;

Select * from marketing_data where campaign_id="CMP-00388";
Select * from marketing_data_cleaned where campaign_id="CMP-00388";

SELECT r.*
FROM marketing_data r
LEFT JOIN marketing_data_cleaned c
  ON r.campaign_id = c.campaign_id
WHERE c.campaign_id IS NULL;



