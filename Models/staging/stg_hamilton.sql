select
  *

from {{ source('postgres', 'finalop_good') }}
