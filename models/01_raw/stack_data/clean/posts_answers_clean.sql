{{
    config(
        materialized='table',
        schema='clean_rittman',
        tags = ["Rittman"]
    )
}}
select  
id,
title,
body,
accepted_answer_id,
answer_count,
comment_count,
community_owned_date,
creation_date,
favorite_count,
last_activity_date,
last_edit_date,
last_editor_display_name,
last_editor_user_id,
owner_display_name,
owner_user_id,
parent_id,
post_type_id,
score,
tags,
view_count
from rittman-analytics-trial-gj.stack_data.posts_answers
