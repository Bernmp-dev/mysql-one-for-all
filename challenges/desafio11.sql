SELECT 
	a.album AS album,
    COUNT(f.cancao_id) AS favoritadas
FROM 
	favoritas AS f
INNER JOIN
	cancao AS c ON c.cancao_id = f.cancao_id
INNER JOIN 
	album AS a ON a.album_id = c.album_id
GROUP BY 
	album
ORDER BY
	favoritadas DESC LIMIT 3;