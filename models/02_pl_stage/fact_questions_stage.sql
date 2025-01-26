{{
    config(
        materialized='table',
        schema='rittman_stage',
        tags = ["Rittman"]
    )
}}


SELECT
  q.id,
  q.title,
  q.body,
  q.accepted_answer_id,
  q.creation_date,
  q.last_activity_date,
  q.last_editor_user_id,
  q.owner_user_id,
  uq.display_name                       as question_user_display_name,
  uq.about_me                           as question_user_about_me,
  uq.age                                as question_user_age,
  uq.creation_date                      as question_user_account_creation_date,
  uq.last_access_date                   as question_user_last_access_date,
  uq.location                           as question_user_location,
  q.tags,
  q.view_count,
  a.answer_body,
  a.answer_last_activity_date, 
  a.answer_ast_edit_date,
  a.answer_last_editor_display_name,
  a.answer_last_editor_user_id,
  a.answer_owner_display_name,
  a.answer_owner_user_id,
  ua.display_name                       as answer_user_display_name,
  ua.about_me                           as answer_user_about_me,  
  ua.age                                as answer_user_age,
  ua.creation_date                      as answer_user_account_creation_date,
  ua.location                           as answer_user_location

FROM
  {{ref('posts_questions_clean')}} q
left join
  {{ref('posts_answers_clean')}} a
  on q.id = a.question_id
left join
  {{ref('dim_users')}} uq
  on q.owner_user_id = uq.id
left join
  {{ref('dim_users')}} ua
  on a.answer_owner_user_id = ua.id
