{{
    config(
        materialized='table',
        schema='pl_rittman',
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
    profile_image_url,
    website_url
from {{ref('dim_users_stage')}}