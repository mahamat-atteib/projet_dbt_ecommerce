-- Total des achats par client et classement des clients

{{ 
    config(materialized='table') 
}}

with achats_par_client as (
    select client_id, sum(montant) as montant_total
    from {{ ref("src_achats") }}
    group by client_id
)

select c.client_id, c.nom, c.email, a.montant_total
from achats_par_client a
inner join {{ ref("src_clients") }} c on a.client_id = c.client_id
order by a.montant_total desc
limit 5
