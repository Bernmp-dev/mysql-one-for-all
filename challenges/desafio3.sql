SELECT 
	pu.nome_pessoa_usuaria pessoa_usuaria,
	COUNT(h.pessoa_usuaria_id) musicas_ouvidas,
	ROUND(SUM(c.duracao_segundos)/60, 2) total_minutos
FROM
	pessoa_usuaria pu 
INNER JOIN
	historico h ON h.pessoa_usuaria_id = pu.pessoa_usuaria_id
INNER JOIN 	
	cancao c ON c.cancao_id = h.cancao_id
GROUP BY 
	pu.nome_pessoa_usuaria
ORDER BY 
	pu.nome_pessoa_usuaria;