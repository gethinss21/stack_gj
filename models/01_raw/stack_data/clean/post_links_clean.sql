{{
    config(
        materialized='table',
        schema='clean_rittman',
        tags = ["Rittman"]
    )
}}
select  
id,
creation_date,
link_type_id,
post_id,
related_post_id
from rittman-analytics-trial-gj.stack_data.post_links
