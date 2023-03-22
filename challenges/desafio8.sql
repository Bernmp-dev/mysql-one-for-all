SELECT 
	ar.artista_nome AS artista,
    al.album AS album
FROM 
	artista AS ar
INNER JOIN 
	album AS al ON ar.artista_id = al.artista_id
GROUP BY 
	album, artista
LIMIT 2 OFFSET 3;