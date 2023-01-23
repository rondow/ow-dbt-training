{% for i in range(10) %}
 
   SELECT {{ i }} AS NUMBER {% if not loop.last %} union all {% endif %}

   {% endfor %}
