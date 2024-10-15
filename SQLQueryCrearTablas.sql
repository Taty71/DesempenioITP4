USE [IssdTP42023]
CREATE TABLE Directores (
    id INT PRIMARY KEY IDENTITY(0,1),
    apellido VARCHAR(50) NOT NULL,
    nombre VARCHAR(50) NOT NULL
);

USE [IssdTP42023]
CREATE TABLE Peliculas (
    id INT PRIMARY KEY IDENTITY(0,1),
    nombrePelicula VARCHAR(150) NOT NULL,
    idDirector INT FOREIGN KEY REFERENCES Directores(id)
);
