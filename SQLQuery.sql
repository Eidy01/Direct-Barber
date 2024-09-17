CREATE DATABASE directBarber;
USE directBarber;

CREATE TABLE Users (
    ID INT IDENTITY PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    CorreoElectronico VARCHAR(100) UNIQUE NOT NULL,
    Contrasena VARCHAR(255) NOT NULL,
    Direccion TEXT,
    Telefono VARCHAR(20),
    FechaRegistro DATETIME DEFAULT GETDATE(),
    CalificacionPromedio DECIMAL(3, 2) DEFAULT 0
);

ALTER TABLE Users ADD Pregunta Varchar (100);


select * from Users;