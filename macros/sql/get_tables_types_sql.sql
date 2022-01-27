{% macro map_table_types(table_type) %}
    {{ return(adapter.dispatch('get_tables_by_pattern_sql', 'dbt_utils')
        (table_type)) }}
{% endmacro %}

{% macro default__map_table_types() %}

            case table_type
                when 'BASE TABLE' then 'table'
                when 'EXTERNAL TABLE' then 'external'
                when 'MATERIALIZED VIEW' then 'materializedview'
                else lower(table_type)
            end as "table_type"

{% endmacro %}


{% macro postgres__map_table_types() %}

            case table_type
                when 'BASE TABLE' then 'table'
                when 'EXTERNAL TABLE' then 'external'
                when 'FOREIGN' then 'external'
                when 'MATERIALIZED VIEW' then 'materializedview'
                else lower(table_type)
            end as "table_type"

{% endmacro %}
