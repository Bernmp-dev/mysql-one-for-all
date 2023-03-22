SELECT 
	c.cancao AS cancao,
	COUNT(h.pessoa_usuaria_id) AS reproducoes
FROM
	cancao AS c 
INNER JOIN
	historico AS h ON h.cancao_id = c.cancao_id
GROUP BY 
	c.cancao
ORDER BY reproducoes DESC, cancao ASC 
LIMIT 2;