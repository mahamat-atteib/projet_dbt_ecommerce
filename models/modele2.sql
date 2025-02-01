-- Liste des clients habitant à 'Mexico'

{{
    config(materialized='table')
    }}

with client as (
    select * from {{ref("src_clients")}}
)

select *
from client
where pays = 'Mexico'