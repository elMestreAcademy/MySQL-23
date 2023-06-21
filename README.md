# Centro Educativo - Proyecto MySQL y Python

Pequeño programa de ejemplo para demostar el uso de MySQL

## Descripción

Este proyecto consiste en un script de Python que interactúa con una base de datos MySQL para gestionar un centro educativo. El script permite visualizar la información del profesor y los alumnos asignados a cada aula.

## Requisitos

- Python 3.6 o superior
- MySQL Server 5.6 o superior
- mysql-connector-python módulo de Python

## Instalación

Asegúrate de que tienes Python instalado en tu sistema. Puedes verificar esto usando el comando python --version en tu terminal. Si Python no está instalado, puedes descargarlo desde la página oficial de Python.

Instala el servidor MySQL en tu sistema, si aún no lo tienes. Puedes descargarlo desde la página oficial de MySQL.

Instala el módulo mysql-connector-python en Python. Esto te permitirá conectarte a la base de datos MySQL desde tus scripts de Python. Puedes instalarlo usando pip: pip install mysql-connector-python.

## Configuración

Ejecuta el script SQL proporcionado para crear las tablas e insertar los datos de prueba en tu base de datos MySQL. Esto se debe hacer a través de la interfaz de línea de comandos de MySQL, phpMyAdmin o cualquier otra herramienta de gestión de MySQL que prefieras.

Actualiza la configuración de la base de datos en el script de Python para que coincida con tu configuración de MySQL local. Esto incluye el nombre de usuario, la contraseña, el host, el puerto y el nombre de la base de datos.

## Uso

Ejecuta el script de Python en tu terminal con el comando python script.py. Verás la salida de las consultas de los profesores y los alumnos en cada aula.

## Notas

Por favor, recuerda siempre seguir las mejores prácticas de seguridad al manipular las bases de datos. Esto incluye no compartir nunca tus credenciales de la base de datos y asegurarte de que tu base de datos esté adecuadamente protegida y respaldada.

## MySQL Syntax highlight

VS Code extension: **python-string-sql**

[fuente stackoverflow](https://stackoverflow.com/questions/51534758/visual-studio-code-sql-syntax-highlighting-in-py-files)

    query = f"""--sql
    SELECT * FROM mytable;
    """
