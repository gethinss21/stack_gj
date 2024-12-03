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
post_history_type_id,
revision_guid,
user_id,
text,
comment
from rittman-analytics-trial-gj.stack_data.post_history
