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
    location,
    profile_image_url,
    last_access_date,
    website_url
from {{ref('users_clean')}}