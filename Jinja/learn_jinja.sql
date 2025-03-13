-- simple jinja

{% set my_cool_string = 'wow! cool!'%}
{% set my_second_cool_string = 'this is jinja'%}
{% set my cool_number = 100 %}


{{ my_cool_string }} # double {{}} to print things out. 
{{my_second_cool_string}} I want to write Jinja for {{my_cool_number}} for 100 years.

  
 -- write jinja to print list of animals

{% set my_animals = ['lemur','wolf','panther','tardigrade' ] %}

{% for animal in my_animals%}

My favorite animal is the {{ animal }}
  
{%endfor%}

  
-- write jinja to decide to drink cappuccino or cold brew base on the temperature 

{% set temperature = 75 %}
{% if temperature  < 65%}
Time for cappuccino 

{% else %}
Time for cold brew 
  
{% end if  %}



-- List: print if the food is snack or vegetable 

{%- set foods = ['carrot','hotdog','cucumber','bell pepper' ]  -%}

{% for item in foods -%}
{%- if item == 'hotdog' -%}
{%- set food_type = 'snack' -%}
{%- else -%}
{%- set food_type = 'vegetable' -%}

{%- endif -%}

The {{ item }} is my favorite {{ food_type }}

{% endfor  %}


--  dictionary 

{%- set webster_dict = {

'word':'data',
'speech_part':'noun',
'definition':'if you know you know'

} %}

{{webster_dict['word']}}({{webster_dict['speech_part']}}): defined as "webster_dict['definition']"

# print: data(noun): "if you know you know"
