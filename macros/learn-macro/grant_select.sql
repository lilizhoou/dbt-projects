-- This is an advanced macro

-- SnowFlake Syntax: https://docs.snowflake.com/en/sql-reference/sql/grant-privilege
{% macro grant_select(schema=target.schema, role=target.role) %}

{% set grant_sql %}

        grant usage on schema {{ schema }} to role {{ role }};
        grant select on all tables in schema {{ schema }} to role {{ role }};
        grant  select on all views in schema {{ schema }} to role {{ role }};
{% endset %}

{{ log('granting on schema ' ~ target.schema ~ ' to role ' ~role, info=True) }}
  
{% do run_query(grant_sql) %}
  
{{ log('granted successfully!', info=True) }}
{% endmacro %}
