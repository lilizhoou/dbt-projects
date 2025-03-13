''' 
Exercise Goal: 
  Turn following SQL into Jinja to make it more flexible to change.
  
'''

with payments as (
  select * from stg_payments
),

pivoted as (

select 
  order_id,
  sum(case when payment_method = 'bank_transfer' then amount else 0 end) as bank_transfer_amount,
  sum(case when payment_method = 'coupon' then amount else 0 end) as coupon_amount,
  sum(case when payment_method = 'credit_card' then amount else 0 end) as credit_card_amount,
  sum(case when payment_method = 'gift_card' then amount else 0 end) as gift_card_amount

from payments 
where status = 'success'
group by 1 

)

select * from pivoted 

================================
  
-- Jinja added in 


{%- set payment_method = ['bank_transfer','coupon','credit_card','gift_card'] -%}
--  so we can add any other payment method in future as need without change main code, just need to revise here little bit. 
  
with payments as (
  
  select * from {{ref('stg_payments')}}
  
),

pivoted as (

select 
  
	order_id,
  
	{% for i in payment_method %}  
	sum(case when payment_method = '{{i}}' then amount else 0 end) as {{i}}_amount  
		{%- if not loop.last%}
			,
		{% endif %}
	{% endfor %}
  
from payments 
where status = 'success'
group by 1 

)

select * from pivoted 

