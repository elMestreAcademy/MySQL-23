CREATE DATABASE IF NOT EXISTS centro_educativo;
USE centro_educativo;

CREATE TABLE IF NOT EXISTS aulas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS alumnos (
    usuario_id INT,
    FOREIGN KEY(usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE IF NOT EXISTS profesores (
    usuario_id INT,
    nota_minima INT NOT NULL,
    nota_maxima INT NOT NULL,
    FOREIGN KEY(usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE IF NOT EXISTS aulas_profesores (
    aula_id INT,
    profesor_id INT,
    FOREIGN KEY(aula_id) REFERENCES aulas(id),
    FOREIGN KEY(profesor_id) REFERENCES profesores(usuario_id)
);

CREATE TABLE IF NOT EXISTS aulas_alumnos (
    aula_id INT,
    alumno_id INT,
    FOREIGN KEY(aula_id) REFERENCES aulas(id),
    FOREIGN KEY(alumno_id) REFERENCES alumnos(usuario_id)
);

INSERT INTO aulas (nombre) VALUES ('Aula 1 - Código sin sentido');

INSERT INTO usuarios (nombre, apellido, correo) VALUES ('Pepito', 'Profesor', 'pepito@profesor.centro.com');
SET @profesor_id = LAST_INSERT_ID();
INSERT INTO profesores (usuario_id, nota_minima, nota_maxima) VALUES (@profesor_id, 5, 10);
INSERT INTO aulas_profesores (aula_id, profesor_id) VALUES (1, @profesor_id);

INSERT INTO usuarios (nombre, apellido, correo) VALUES ('Juanito', 'Alumno Uno', 'juanito@almuno.centro.com');
SET @alumno_id = LAST_INSERT_ID();
INSERT INTO alumnos (usuario_id) VALUES (@alumno_id);
INSERT INTO aulas_alumnos (aula_id, alumno_id) VALUES (1, @alumno_id);

INSERT INTO usuarios (nombre, apellido, correo) VALUES ('Jorgito', 'Alumno Dos', 'jorgito@almuno.centro.com');
SET @alumno_id = LAST_INSERT_ID();
INSERT INTO alumnos (usuario_id) VALUES (@alumno_id);
INSERT INTO aulas_alumnos (aula_id, alumno_id) VALUES (1, @alumno_id);

INSERT INTO usuarios (nombre, apellido, correo) VALUES ('Jaimito', 'Alumno Tres', 'jaimito@almuno.centro.com');
SET @alumno_id = LAST_INSERT_ID();
INSERT INTO alumnos (usuario_id) VALUES (@alumno_id);
INSERT INTO aulas_alumnos (aula_id, alumno_id) VALUES (1, @alumno_id);
