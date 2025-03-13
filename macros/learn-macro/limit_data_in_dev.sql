''' here is another example of macro, to limit data when you develop in dev, so you can save more time by running all data in dev. '''

{% macro limit_data_in_dev(column_name,dev_days_of_data = 3)  -%}

{% if target.name == 'dev' %}

where {{column_name}} >= date_add('day' -  {{dev_days_of_data }},current_timestamp)

{% endif %}
{%- endmacro%}



-- use this macro limit

select 
id as order_id,
user_id,
order_date,
status
from payment_table

{{  limit_data_in_dev('order_date',100  }}
