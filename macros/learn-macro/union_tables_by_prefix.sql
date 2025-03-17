
{%- macro union_tables_by_prefix(database, schema, prefix) -%}

    {%- set tables = dbt_utils.get_relations_by_prefix(database=database, schema=schema, prefix=prefix) -%}
-- Details of this util:  https://github.com/dbt-labs/dbt-utils?tab=readme-ov-file#get_relations_by_prefix-source
  
    {% for table in tables %}

        {%- if not loop.first -%}
        union all 
        {%- endif %}
        
        select * from {{ table.database }}.{{ table.schema }}.{{ table.name }}
      
    {% endfor -%}
  
{%- endmacro -%}
