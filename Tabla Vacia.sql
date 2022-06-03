CREATE DATABASE UniversoLector;

USE UniversoLector;

CREATE TABLE Socio (
	ID int NOT NULL,
    DNI int,
    Apellido VARCHAR(100),
    Nombres VARCHAR(100),
    Direccion VARCHAR(200),
    Localidad VARCHAR (100),
    PRIMARY KEY (ID)
);
    
ALTER TABLE Socio MODIFY COLUMN ID int NOT NULL AUTO_INCREMENT;
ALTER TABLE Socio DROP COLUMN ID;
ALTER TABLE Socio ADD COLUMN Codigo int NOT NULL AUTO_INCREMENT PRIMARY KEY;


CREATE TABLE TelefonoxSocio (
	Codigo int NOT NULL auto_increment,
    NroTelefono VARCHAR(100),
    Codigo_Socio int,
    PRIMARY KEY (Codigo),
    FOREIGN KEY (Codigo_Socio) REFERENCES Socio(Codigo)
);

SELECT * FROM Socio;

ALTER TABLE Socio MODIFY Codigo int FIRST;

CREATE TABLE Autor (
	Codigo int NOT NULL auto_increment,
    Apellido VARCHAR(100),
    Nombre VARCHAR(100),
    PRIMARY KEY (Codigo)
);

CREATE TABLE Editorial (
	Codigo int NOT NULL auto_increment,
    Razon_Social VARCHAR(100),
    Telefono VARCHAR(100),
    PRIMARY KEY (Codigo)
);




CREATE TABLE Libro (
	Codigo int NOT NULL auto_increment,
    ISBN VARCHAR(13),
    Titulo VARCHAR(200),
    Anio_Escritura DATE,
    Codigo_Autor int,
    Anio_Edicion Date,
    Codigo_Editorial int,
    PRIMARY KEY (Codigo),
    FOREIGN KEY (Codigo_Autor) REFERENCES Autor(Codigo),
    FOREIGN KEY (Codigo_Editorial) REFERENCES Socio(Codigo)
);



CREATE TABLE Prestamo (
	Codigo int NOT NULL auto_increment,
    Codigo_Socio int,
    Fecha DATETIME,
    Fecha_Devolucion DATE,
    Fecha_Tope Date,
    PRIMARY KEY (Codigo),
    FOREIGN KEY (Codigo_Socio) REFERENCES Socio(Codigo)
    
);

CREATE TABLE Volumen (
	Codigo int NOT NULL auto_increment,
    Codigo_Libro int,
    Deteriorado BOOL,
    PRIMARY KEY (Codigo),
	FOREIGN KEY (Codigo_Libro) REFERENCES Libro(Codigo)
);

CREATE TABLE PrestamoxVolumen (
	Codigo int NOT NULL auto_increment,
    Codigo_Prestamo int,
    Codigo_Volumen int,
    PRIMARY KEY (Codigo),
	FOREIGN KEY (Codigo_Prestamo) REFERENCES Prestamo(Codigo),
    FOREIGN KEY (Codigo_Volumen) REFERENCES Volumen(Codigo)
);







