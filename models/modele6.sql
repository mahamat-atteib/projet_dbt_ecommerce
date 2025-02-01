-- Les 2 Produits le plus vendus

{{ 
    config(materialized='table') 
}}

select produit, count(*) as nombre_ventes
from {{ ref('src_achats') }}
group by produit
order by nombre_ventes desc limit 2
