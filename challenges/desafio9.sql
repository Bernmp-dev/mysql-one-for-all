SELECT 
	COUNT(h.pessoa_usuaria_id) AS musicas_no_historico
FROM
	historico AS h 
INNER JOIN
	pessoa_usuaria pu ON h.pessoa_usuaria_id = pu.pessoa_usuaria_id
WHERE
	pu.pessoa_usuaria_id = 1
GROUP BY
	h.pessoa_usuaria_id;