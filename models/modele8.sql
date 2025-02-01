{{ config(materialized='table') }}

-- Requête CTE
WITH depense_par_pays AS (
    SELECT
        c.pays,
        -- Appel de la macro "total_depense_client"
        -- On rajoute la fonction SUM car on somme les dépenses pour chaque pays. On aggrège !
        ROUND(SUM({{ total_depense_client('c.client_id') }}), 2) AS total_depense_par_pays
    FROM
        {{ ref('src_clients') }} c
    GROUP BY
        c.pays
)

-- Requête Principale
SELECT
    pays,
    total_depense_par_pays
FROM depense_par_pays
WHERE total_depense_par_pays > 2000
ORDER BY total_depense_par_pays DESC