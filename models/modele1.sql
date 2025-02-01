-- Requête permettant de trouver le Nombre des clients et le montant total des achats par Pays
{{ 
    config(materialized='table') 
}}

with achat as (
    select * from {{ref("src_achats")}}
    ), 

    client as (
        select * from {{ref("src_clients")}}
        )

select client.pays, count(*) as nombre_client, round(sum(achat.montant), 2) as montant_total
from client inner join achat on client.client_id = achat.client_id
group by pays
order by montant_total desc