{% macro dev_else_prod_schema() %}{{ target.schema if target.name == 'PROJECT-NAME_dev' else 'dw' }}_{{ config.get('schema') }}{% endmacro %}