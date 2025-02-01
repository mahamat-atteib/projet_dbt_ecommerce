-- Nombre de clients par abonnements

{{
    config(materialized='table')
}}

-- CTE
with abonnement_par_service as (
    select service, count(distinct client_id) as nombre_client,  
    from {{ref('src_abonnements')}}
    group by service
)

select a.service, a.nombre_client
from abonnement_par_service as a
order by a.nombre_client desc