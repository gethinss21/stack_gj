{{
    config(
        materialized='table',
        schema='pl_rittman',
        tags = ["Rittman"],
        partition_by={
            "field": "creation_date",
            "data_type": "timestamp",
            "granularity": "Year"
        },
        cluster_by = ["tags"]
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
  q.question_user_display_name,
  q.question_user_about_me,
  q.question_user_age,
  q.question_user_account_creation_date,
  q.question_user_last_access_date,
  q.question_user_location,
  q.tags,
  q.view_count,
  q.answer_body,
  q.answer_last_activity_date, 
  q.answer_ast_edit_date,
  q.answer_last_editor_display_name,
  q.answer_last_editor_user_id,
  q.answer_owner_display_name,
  q.answer_owner_user_id,
  q.answer_user_display_name,
  q.answer_user_about_me,  
  q.answer_user_age,
  q.answer_user_account_creation_date,
  q.answer_user_location

FROM
  {{ref('fact_questions_stage')}} q
