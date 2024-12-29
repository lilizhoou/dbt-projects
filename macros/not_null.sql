-- we dont have do this as dbt pre-defined this for us, but here is the code

{% macro no_nulls_in_columns(model) %}
   
    SELECT * FROM {{ model }} WHERE
    {% for col in adapter.get_columns_in_relation(model) -%}
        {{ col.column }} IS NULL OR
    {% endfor %}
    
    FALSE
{% endmacro %}