{{
    config(
        materialized='table',
        schema='clean_rittman'
    )
}}
select  
    id,
    display_name,
    about_me,
    age,
    creation_date,
    last_access_date,
    location,
    reputation,
    up_votes,
    down_votes,
    views,
    profile_image_url,
    website_url,

    -- meta fields
    meta_process_time,
    meta_delivery_time
from {{ ref('users') }}
