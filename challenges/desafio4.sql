SELECT 
	pu.nome_pessoa_usuaria AS pessoa_usuaria,
	IF(MAX(YEAR(h.data_de_reproducao)) >= 2021, 'Ativa', 'Inativa')AS status_pessoa_usuaria
FROM
	pessoa_usuaria AS pu 
INNER JOIN
	historico AS h ON h.pessoa_usuaria_id = pu.pessoa_usuaria_id
GROUP BY 	
	pu.nome_pessoa_usuaria
ORDER BY 
	pu.nome_pessoa_usuaria;