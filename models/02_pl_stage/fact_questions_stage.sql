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
  q.tags,
  q.view_count
  a.answer_body,
  a.answer_last_activity_date, 
  a.answer_ast_edit_date,
  a.answer_last_editor_display_name,
  a.answer_last_editor_user_id,
  a.answer_owner_display_name,
  a.answer_owner_user_id,

FROM
  {{ref('posts_questions_clean')}} q
left join
  {{ref('dim_users')}} uq
  on q.owner_user_id = uq.id
left join
  {{ref('dim_users')}} ua
  on a.answer_owner_user_id = ua.id
left join
  {{ref('posts_answers_clean')}} a
  on q.id = a.question_id