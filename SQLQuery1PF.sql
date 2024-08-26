CREATE DATABASE directBarber;
USE directBarber:

-- Tabla de Usuarios
CREATE TABLE Users (
    ID PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    CorreoElectronico VARCHAR(100) UNIQUE NOT NULL,
    Contrasena VARCHAR(255) NOT NULL,
    Direccion TEXT,
    Telefono VARCHAR(20),
    FechaRegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CalificacionPromedio DECIMAL(3, 2) DEFAULT 0
);

-- Tabla de Administradores
CREATE TABLE Admins (
    ID PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    CorreoElectronico VARCHAR(100) UNIQUE NOT NULL,
    Contrasena VARCHAR(255) NOT NULL,
    Rol VARCHAR(50) -- Nuevo campo para el rol del administrador
);

-- Tabla de Solicitudes de Servicio
CREATE TABLE ServiceRequests (
    ID PRIMARY KEY,
    Client INT REFERENCES Users(ID),
    barber INT REFERENCES Users(ID),
    FechaHoraSolicitud TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FechaHoraServicio TIMESTAMP,
    DireccionServicio TEXT,
    Estado VARCHAR(20) DEFAULT 'pendiente',
    Precio DECIMAL(10, 2),
    NotasAdicionales TEXT
);

-- Tabla de Servicios
CREATE TABLE Services (
    ID SERIAL PRIMARY KEY,
    Descripcion TEXT,
    PrecioBase DECIMAL(10, 2),
    FechaDisponible DATETIME -- Corrección del tipo de dato
);

-- Tabla de Calificaciones y Reseñas
CREATE TABLE RatingsAndReviews (
    ID PRIMARY KEY,
    UsuarioID INT REFERENCES Users(ID),
    SolicitudID INT REFERENCES ServiceRequests(ID),
    Calificacion INT CHECK (Calificacion BETWEEN 1 AND 5),
    Comentario TEXT,
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Pagos
CREATE TABLE Pagos (
    ID PRIMARY KEY,
    UsuarioID INT REFERENCES Users(ID),
    SolicitudID INT REFERENCES ServiceRequests(ID),
    Monto DECIMAL(10, 2),
    FechaPago TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    MetodoPago VARCHAR(50),
    EstadoPago VARCHAR(20) DEFAULT 'pendiente'
);




INSERT INTO Admins (Nombre, Apellido, CorreoElectronico, Contrasena, Rol)
VALUES ('Juan', 'Pérez', 'juan.perez@ejemplo.com', 'contraseñaSegura', 'Administrador');