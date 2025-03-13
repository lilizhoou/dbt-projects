''' 
  we have one column amount stores numbers in cents, we want to convert into dollar.
  we can create a macro, so we can use this logic in other projects. 
'''

 -- orginal model 
select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    -- amount stored in cents, convert to dollars
    amount / 100 as amount,
    created as created_at
from {{ source(‘stripe’, ‘payment’) }}

--  Create macro under macro folder in your dbt project
-- macros/cents_to_dollars.sql
  
{% macro cents_to_dollars(column_name, decimal_place = 2)  -%}

  round(1.0 {{column_name}} / 100,{{decimal_place}})
  
{%- endmacro%}

--  use created cents_to_dollars macro in your origin model 

select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    
    -- here, use macro we created 
    {{cent_to_dollars('amount') as amount

    created as created_at
from {{ source(‘stripe’, ‘payment’) }}
