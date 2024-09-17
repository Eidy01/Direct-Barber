SELECT * FROM Usuario;
use DirectBarber1;

Drop table Solicitud;

CREATE TABLE Solicitud (
    id_Solicitud INT IDENTITY(1,1) PRIMARY KEY,
    id_Cliente INT NULL,
    id_Barbero INT NULL,
	Dirección NVarchar(MAX),
    fecha DATETIME,
    descripcion NVARCHAR(200),
    precio DECIMAL(10,2),
    FOREIGN KEY (id_Cliente) REFERENCES Usuario(Id),
    FOREIGN KEY (id_Barbero) REFERENCES Usuario(Id),
);

SELECT * FROM Rol;
SELECT * FROM Usuario;
SELECT * FROM Solicitud;
