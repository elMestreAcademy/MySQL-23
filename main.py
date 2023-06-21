import mysql.connector
from mysql.connector import errorcode

config = {
    'user': 'root',
    'password': '',
    'host': 'localhost',
    'port': 3306,
    'database': 'centro_educativo',
    'raise_on_warnings': True
}

try:
    cnx = mysql.connector.connect(**config)

except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Algo está mal con el nombre de usuario o contraseña")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("La base de datos no existe")
    else:
        print(err)

else:
    with cnx.cursor() as cursor:
        # Consulta para obtener todas las aulas y sus profesores
        cursor.execute("""
        SELECT a.id, a.nombre, u.nombre, u.apellido, u.correo
        FROM aulas a
        INNER JOIN aulas_profesores ap ON a.id = ap.aula_id
        INNER JOIN profesores p ON ap.profesor_id = p.usuario_id
        INNER JOIN usuarios u ON p.usuario_id = u.id;
        """)

        # Mapeamos el resultado en un diccionario para fácil acceso
        aulas = {}
        for (id_aula, nombre_aula, nombre_prof, apellido_prof, correo_prof) in cursor:
            aulas[id_aula] = {
                'nombre': nombre_aula, 'profesor': f'{nombre_prof} {apellido_prof} ({correo_prof})', 'alumnos': []}

        # Consulta para obtener todos los alumnos y a qué aula están asignados
        cursor.execute("""
        SELECT a.id, u.nombre, u.apellido, u.correo
        FROM aulas a
        INNER JOIN aulas_alumnos aa ON a.id = aa.aula_id
        INNER JOIN alumnos al ON aa.alumno_id = al.usuario_id
        INNER JOIN usuarios u ON al.usuario_id = u.id;
        """)

        for (id_aula, nombre_alumno, apellido_alumno, correo_alumno) in cursor:
            aulas[id_aula]['alumnos'].append(
                f'{nombre_alumno} {apellido_alumno} ({correo_alumno})')

    # Imprimimos el informe
    for id_aula, aula in aulas.items():
        print(f"Aula ID: {id_aula}")
        print(f"Nombre del Aula: {aula['nombre']}")
        print(f"Profesor Asignado: {aula['profesor']}")
        print("Alumnos:")
        for alumno in aula['alumnos']:
            print(f"  - {alumno}")
        print("\n")

    cnx.close()
