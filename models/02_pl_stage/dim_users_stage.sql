{{
    config(
        materialized='table',
        schema='rittman_stage',
        tags = ["Rittman"]
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
    website_url
from {{ref('users_clean')}}