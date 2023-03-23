SELECT 
	CASE 
        WHEN pu.idade <= 30 THEN 'Até 30 anos'
        WHEN pu.idade <= 60 THEN 'Entre 31 e 60 anos'
        ELSE 'Maior de 60 anos'
    END AS faixa_etaria,
		COUNT(DISTINCT(pu.pessoa_usuaria_id)) AS total_pessoas_usuarias,
		COUNT(f.cancao_id) AS total_favoritadas
FROM 
	pessoa_usuaria AS pu 
LEFT JOIN 
	favoritas AS f ON pu.pessoa_usuaria_id = f.pessoa_usuaria_id
group by
	faixa_etaria
ORDER BY
	faixa_etaria;