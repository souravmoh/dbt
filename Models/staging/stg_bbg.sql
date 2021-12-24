with source as (



select * from {{ ref('BBG_BO_202111203') }}



)



select * from source
