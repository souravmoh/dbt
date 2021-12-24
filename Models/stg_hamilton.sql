source as (



select * from {{ ref('Hamilton') }}



)



select * from source
