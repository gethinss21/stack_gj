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
post_id,
vote_type_id
from rittman-analytics-trial-gj.stack_data.votes
