{{
    config(
        materialized='table',
        schema='clean_rittman',
        tags = ["Rittman"]
    )
}}
select  
id,
tag_name,
count,
excerpt_post_id,
wiki_post_id
from rittman-analytics-trial-gj.stack_data.tags
