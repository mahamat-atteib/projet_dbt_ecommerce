-- Identifier les clients ayant depensé plus de 1300€

{{
    config(materialized='table')
}}

-- requête CTE
with depense_client as
(
    select c.client_id,
           c.nom, 
           c.pays, 
           {{ total_depense_client('c.client_id') }} as total_depense  -- appel de la macro "total_depense_client"
    from {{ref('src_clients')}} c
)

-- Requête Principale
select * 
from depense_client
where total_depense > 1300
order by total_depense desc