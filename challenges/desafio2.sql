SELECT DISTINCT
	COUNT(DISTINCT c.cancao_id )AS cancoes,
	COUNT(DISTINCT art.artista_id )AS artistas,
	COUNT(DISTINCT alb.album_id )AS albuns
FROM
	artista art 
INNER JOIN
	album alb ON alb.artista_id = art.artista_id
INNER JOIN 	
	cancao c ON c.album_id = alb.album_id;