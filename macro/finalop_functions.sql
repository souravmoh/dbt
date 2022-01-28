{% macro finalop_transformation_1(col1,col2) %}
    (case
    when {{col1 }} is not null and {{col2}}=2 then 100-{{col1}}
    else {{col1}}
    end)
{% endmacro %}
{% macro finalop_transformation_2(col3,col4) %}
    (case
    when {{col3}}='Y' and {{col4}}='Y' then 'BEARREG'
    when {{col3}}='Y' and ({{col4}}='N' or {{col4}} is null) then 'BEARER'
    when ({{col3}}='N' or {{col3}} is null) and {{col4}}='Y' then 'REGSTRD'
    else 'UNKNOWN'
    end)
{% endmacro %}
{% macro finalop_transformation_3_and_4(col5,col6,col7) %}
    (case
    when {{col5}}='MBONO' then {{col7}}/100
    when {{col5}} in ('BLFT','BLTN','BNTNB','BNTNC','BNTNF') then {{col7}}/1000
    when {{col6}} is not null then {{col7}}/{{col6}}
    else {{col7}}
    end)
{% endmacro %}
{% macro finalop_transformation_5(col8,col9) %}
(case
 when {{col8 }} is not null then {{col8}}
 when {{col9}}='N' then 1 
 when {{col9}}='Y' then 100
 end)
{% endmacro %}
{% macro finalop_transformation_6(col10) %}
(case
 when {{col10}}='Y' then 'FULLY'
 else 'INCOMPLETE'
 end)
{% endmacro %}
