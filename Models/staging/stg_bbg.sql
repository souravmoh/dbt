select
  *
from {{ source('postgres', 'final_bo') }}
