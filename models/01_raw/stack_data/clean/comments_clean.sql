{{
    config(
        materialized='table',
        schema='clean_rittman',
        tags = ["Rittman"]
    )
}}
select  
id,
text,
creation_date,
post_id,
user_id,
user_display_name,
score
from rittman-analytics-trial-gj.stack_data.comments
