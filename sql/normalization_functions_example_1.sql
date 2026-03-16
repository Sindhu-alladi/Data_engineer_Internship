use messy_transformed_data;

-- ROW_NUMBER
select * from(
select *,ROW_NUMBER() over(
partition by lower(campaign_id )
order by end_date DESC) as r
from marketing_data_cleaned
)t
where r = 1;

-- RANK
select * from(
select lower(campaign_id) as campaign_id,trim(lower(campaign_name)) as campaign_name,
sum(conversions) as total_conversions,
RANK() over(
order by sum(conversions) DESC) as campaign_rank
from marketing_data_cleaned
group by campaign_id,campaign_name)t
where campaign_rank <= 15;


-- DENSE_RANK 
select * from(
select lower(campaign_id) as campaign_id,trim(lower(campaign_name)) as campaign_name,
sum(spend) as total_spend,
DENSE_RANK() over(
order by sum(spend) DESC) as spend_tier
from marketing_data_cleaned
group by lower(campaign_id),trim(lower(campaign_name)))t
where spend_tier <=3;



