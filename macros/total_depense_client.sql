-- Macro pour calculer la dépense de chaque client
-- Pour appeler le macro dans un modèle, on l'appelle par son nom 'total_depense_client'.
-- Le paramètre de notre macro est : client_id

{% macro total_depense_client(client_id) %}
    (
    select sum(montant)
        from {{ref("src_achats")}}
        where client_id = {{client_id}}
    )
{% endmacro %}