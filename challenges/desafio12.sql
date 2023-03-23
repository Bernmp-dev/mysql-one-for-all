SELECT 
	ar.artista_nome AS artista,
	CASE 
        WHEN COUNT(f.cancao_id) >= 5 THEN 'A'
        WHEN COUNT(f.cancao_id) BETWEEN 3 AND 4 THEN 'B'
        WHEN COUNT(f.cancao_id) BETWEEN 1 AND 2 THEN 'C'
        ELSE '-'
    END AS ranking
FROM 
	artista AS ar 
LEFT JOIN 
	album AS a ON ar.artista_id = a.artista_id
LEFT JOIN 
	cancao AS c ON a.album_id = c.album_id
LEFT JOIN 
	favoritas AS f ON c.cancao_id = f.cancao_id
GROUP BY 
	artista_nome
ORDER BY 
	CASE 
        WHEN ranking = '-' THEN 6
        ELSE 0
    END ASC,
    ranking ASC, artista;