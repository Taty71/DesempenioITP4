SELECT 
    P.id AS IdPelicula,
    P.nombrePelicula AS NombrePelicula,
    D.nombre AS NombreDirector,
    D.apellido AS ApellidoDirector
FROM 
    IssdTP42023.dbo.Peliculas P
JOIN 
    IssdTP42023.dbo.Directores D ON P.idDirector = D.id
