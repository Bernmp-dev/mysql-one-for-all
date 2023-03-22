SELECT 
	ar.artista_nome AS artista,
    al.album AS album,
    COUNT(sa.pessoa_usuaria_id) AS pessoas_seguidoras
FROM 
	artista AS ar
INNER JOIN 
	album AS al ON ar.artista_id = al.artista_id
INNER JOIN
	seguindo_artistas AS sa ON sa.artista_id = ar.artista_id
GROUP BY 
	album, artista
ORDER BY 
	pessoas_seguidoras DESC, artista, album;