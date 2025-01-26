{{
    config(
        materialized='table',
        schema='clean_rittman',
        tags = ["Rittman"]
    )
}}
select  
id                          as answer_id,
title                       as answer_title,
body                        as answer_body,
comment_count,
community_owned_date,
creation_date               as answer_creation_date,
favorite_count,
last_activity_date          as answer_last_activity_date, 
last_edit_date              as answer_ast_edit_date,
last_editor_display_name    as answer_last_editor_display_name,
last_editor_user_id         as answer_last_editor_user_id,
owner_display_name          as answer_owner_display_name,
owner_user_id               as answer_owner_user_id,
parent_id as question_id,
post_type_id,
score,
tags,
view_count
from {{source("stack_data","posts_answers")}}
