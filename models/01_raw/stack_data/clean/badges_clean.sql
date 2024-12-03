{{
    config(
        materialized='table',
        schema='clean_rittman',
        tags = ["Rittman"]
    )
}}
select  
        id,
        name,
        date,
        user_id,
        class,
        tag_based
from rittman-analytics-trial-gj.stack_data.badges
