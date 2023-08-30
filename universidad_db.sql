create database db_universidad;
use db_universidad;

create table alumno (
	id  int (10) primary key not null,
    nif varchar (9) not null,
    nombre varchar (25) not null,
	apellido1 varchar (50) not null,
	apellido2 varchar (50) not null,
	ciudad varchar (25) not null,
	direccion varchar (50) not null,
	telefono varchar (9) not null,
	fecha_nacimiento date not null,
    sexo ENUM ('H','M') not null

);

#Tabla alumno


INSERT INTO alumno (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo)
VALUES
    (1, '12345678A', 'Juan', 'Pérez', 'González', 'Ciudad A', 'Calle 123', '555-1234', '2000-05-15', 'H'),
    (2, '98765432B', 'María', 'López', 'Sánchez', 'Ciudad B', 'Avenida 456', '555-5678', '1999-10-22', 'M'),
    (3, '56789012C', 'Carlos', 'Martínez', 'Gómez', 'Ciudad C', 'Carrera 789', '555-9876', '2002-02-08', 'H'),
    (4, '34567890D', 'Ana', 'Ramírez', 'Díaz', 'Ciudad A', 'Calle 789', '555-2345', '1998-12-03', 'M'),
    (5, '89012345E', 'Laura', 'Fernández', 'Luna', 'Ciudad B', 'Avenida 1011', '555-8765', '2003-08-17', 'M');

select * from alumno;

create table departamento (
id int (10) primary key not null,
nombre varchar (50) not null

);

#Tabla departamento
INSERT INTO departamento (id, nombre)
VALUES
    (1, 'Informatica'),
    (2, 'Matematicas'),
    (3, 'Economia y empresa'),
    (4, 'Educacion'),
    (5, 'Agronomia');
    
  select * from departamento;  


create table grado (
id int (10) primary key not null,
nombre varchar (100) not null

);

#Tabla grado
INSERT INTO grado (id, nombre)
VALUES
    (1, 'Licenciatura en Ingeniería Informática'),
    (2, 'Licenciatura en Administración de Empresas'),
    (3, 'Ingeniería en Electrónica'),
    (4, 'Licenciatura en Psicología'),
    (5, 'Licenciatura en Derecho');
    
    select *from grado;

create table curso_escolar (
id int (10) primary key not null,
anyo_inicio YEAR (4),
anyo_fin YEAR (4)

);

#tabla curso_escolar

INSERT INTO curso_escolar (id, anyo_inicio, anyo_fin)
VALUES
    (1, 2023, 2024),
    (2, 2024, 2025),
    (3, 2025, 2026),
    (4, 2022, 2023),
    (5, 2026, 2027);
    
    select *from curso_escolar;


create table profesor (
	id  int (10) primary key not null,
    nif varchar (9) not null,
    nombre varchar (25) not null,
	apellido1 varchar (50) not null,
	apellido2 varchar (50) not null,
	ciudad varchar (25) not null,
	direccion varchar (50) not null,
	telefono varchar (9) not null,
	fecha_nacimiento date not null,
    sexo ENUM ('H','M') not null,
    id_departamento int (10) not null,
	FOREIGN KEY (id_departamento) REFERENCES departamento(id)

);

#tabla profesor

INSERT INTO profesor (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, id_departamento)
VALUES
    (1, '123456789', 'Juan', 'Pérez', 'González', 'Ciudad A', 'Calle 123', '555-1234', '1980-05-15', 'H', 1),
    (2, '987654321', 'María', 'López', 'Sánchez', 'Ciudad B', 'Avenida 456', '555-5678', '1975-10-22', 'M', 2),
    (3, '567890123', 'Carlos', 'Martínez', 'Gómez', 'Ciudad C', 'Carrera 789', '555-9876', '1988-02-08', 'H', 1),
    (4, '345678901', 'Ana', 'Ramírez', 'Díaz', 'Ciudad A', 'Calle 789', '555-2345', '1973-12-03', 'M', 3),
    (5, '890123456', 'Laura', 'Fernández', 'Luna', 'Ciudad B', 'Avenida 1011', '555-8765', '1992-08-17', 'M', 2);
    
    select * from profesor;

create table asignatura (
	id  int (10) primary key not null,
    nombre varchar (100) not null,
    creditos float not null,
    tipo ENUM ('basica','obligatoria', 'optativa') not null,
    curso tinyint(3),
	cuatrimestre tinyint(3),
    id_profesor int (10) not null,
	id_grado int (10) not null,    
	FOREIGN KEY (id_profesor) REFERENCES profesor(id),
	FOREIGN KEY (id_grado) REFERENCES grado(id)

    );
    
    #tabla asignatura
    
    INSERT INTO asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado)
VALUES
    (1, 'Matemáticas I', 4.0, 'obligatoria', 1, 1, 1, 1),
    (2, 'Historia del Arte', 3.0, 'obligatoria', 1, 2, 2, 2),
    (3, 'Optativa de Psicología', 3.0, 'optativa', 3, 1, 5, 4),
    (4, 'Lengua Extranjera', 2.0, 'basica', 4, 2, 3, 1),
    (5, 'Psicología Infantil', 3.0, 'optativa', 5, 2, 5, 4);
    
    
    
    
    create table alumno_se_matricula_asignatura(
    id_alumno int (10) not null,
    id_asignatura int (10) not null,    
    id_curso_escolar int (10) not null,
	PRIMARY KEY (id_alumno,id_asignatura,id_curso_escolar),
    FOREIGN KEY (id_alumno) REFERENCES alumno(id),
    FOREIGN KEY (id_asignatura) REFERENCES asignatura(id),
    FOREIGN KEY (id_curso_escolar) REFERENCES curso_escolar(id)
    
    );
         select * from asignatura;  
    
    #tabla alumno_se_matricula_asignatura
    
    INSERT INTO alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar)
VALUES
    (1, 1, 1),
    (1, 2, 1),
    (2, 1, 1),
    (2, 3, 1),
    (3, 2, 1),
    (3, 4, 1),
    (4, 3, 1),
    (4, 5, 1),
    (5, 1, 1),
    (5, 5, 1);
    
    select * from alumno_se_matricula_asignatura;
	select * from alumno;
	select * from asignatura;
	select * from curso_escolar;
	select * from departamento;
	select * from grado;
	select * from profesor;