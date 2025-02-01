-- Liste des clients ayant un abonnement "actif" et "Exclusive"

{{
    config(materialized='view')
    }}

with abonnement as (
select * from {{ref("src_abonnements")}}
), 

client as (
select * from {{ref("src_clients")}}
)

select client.client_id, client.nom, client.email, abonnement.statut
from client left join abonnement on client.client_id = abonnement.client_id
where abonnement.statut = 'actif' and abonnement.service = 'Exclusive'
