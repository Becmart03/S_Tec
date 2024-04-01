CREATE TABLE Empleados (comisiones double NOT NULL, Personasdocumento int(10) NOT NULL, PRIMARY KEY (Personasdocumento));
CREATE TABLE Personas (documento int(10) NOT NULL AUTO_INCREMENT, nombre varchar(45) NOT NULL, apellido varchar(45) NOT NULL, email varchar(45) NOT NULL UNIQUE, clave int(10) NOT NULL, PRIMARY KEY (documento));
CREATE TABLE Cliente (descuento double NOT NULL, Personasdocumento int(10) NOT NULL, PRIMARY KEY (Personasdocumento));
ALTER TABLE Empleados ADD CONSTRAINT FKEmpleados956335 FOREIGN KEY (Personasdocumento) REFERENCES Personas (documento);
ALTER TABLE Cliente ADD CONSTRAINT FKCliente641880 FOREIGN KEY (Personasdocumento) REFERENCES Personas (documento);
