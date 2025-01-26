{{
    config(
        materialized='table',
        schema='rittman_stage',
        tags = ["Rittman"]
    )
}}


SELECT
  accepted_answer_id,
  creation_date,
  id,
  last_activity_date,
  last_editor_user_id,
  owner_user_id,
  tags,
  view_count
FROM
  {{ref('posts_questions_clean')}} ;