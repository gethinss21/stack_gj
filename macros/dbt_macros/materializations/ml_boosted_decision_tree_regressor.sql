------------------------------------------------------------------------------------------------------------------------
-- Author: TL
-- This materialisation is used to build a boosted decision tree model (regression)
------------------------------------------------------------------------------------------------------------------------
{% materialization ml_boosted_decision_tree_regressor, default %}

{% set target_relation = this %}

-- 1. Create model
{% set build_model %}
  create or replace model {{this.schema}}.{{this.name}}
  options( {{ model.config.model_options }} ) as {{sql}}
  ;
{% endset %}

-- 2. Evaluate model
{% set build_evaluation %}
  create or replace table {{this.schema}}.{{this.name | replace("_model","")}}_evaluation
  as
  select *
  from  ml.evaluate(model {{this.schema}}.{{this.name}});
{% endset %}

-- 3. Training info
{% set build_training_info %}
  create or replace table {{this.schema}}.{{this.name | replace("_model","")}}_training_info
  as
  select *
  from  ml.TRAINING_INFO(model {{this.schema}}.{{this.name}});
{% endset %}

{% call statement("main") %}
    {{ build_model }}
    {{ build_evaluation }}
    {{ build_training_info }}
{% endcall %}

{{ run_hooks(post_hooks, inside_transaction=True) }}

{% do adapter.commit() %}

{{ run_hooks(post_hooks, inside_transaction=False) }}

{{ return({'relations': [target_relation]}) }}

{% endmaterialization %}
