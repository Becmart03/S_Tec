from flask import Flask, jsonify
from flask import render_template,request,redirect
from flask import request, redirect, url_for, flash, session
# from flaskext.mysql import MySQL
import pymysql

from werkzeug.security import generate_password_hash, check_password_hash
import os
from datetime import timedelta
import secrets
from flask_mail import Mail, Message




app = Flask(__name__)
app.secret_key = secrets.token_hex(16)
app.permanent_session_lifetime = timedelta(minutes=30)
# mysql = MySQL(app)


app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = '920305_Becquet'
app.config['MYSQL_DATABASE_HOST'] = '127.0.0.1'
app.config['MYSQL_DATABASE_DB'] = 'proyecto'
app.config['MYSQL_DATABASE_PORT'] = 3306
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'



app.config['MAIL_SERVER'] = 'smtp.gmail.com'
app.config['MAIL_PORT'] = 587
app.config['MAIL_USE_TLS'] = True
app.config['MAIL_USERNAME'] = 'becmart03@gmail.com'
app.config['MAIL_PASSWORD'] = '1_Vaca_Vestida_De_Uniforme#358'
mail = Mail(app)


db_config = {
    "host": "127.0.0.1",
    "port": 3306,
    "user": "root",
    "password": "920305_Becquet",
    "database": "proyecto"
}



# app.config['MYSQL_USER'] = 'root'
# app.config['MYSQL_PASSWORD'] = '920305_Becquet'
# app.config['MYSQL_HOST'] = 'localhost'
# app.config['MYSQL_DB'] = 'tienda'
# app.config['MYSQL_PORT'] = 3307
# app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

# mysql.init_app(app)

@app.route('/')
def inicio():
    return render_template('admin/admin.html')

# @app.route('/conntest')
# def dbconnect():
#     cur = mysql.connect.cursor()
#     cur.execute( ''' select * FROM usuarios''' )
#     # mysql.connection.commit()
#     resultados= cur.fetchall()
#     print(resultados)
#     return 'Done'

@app.route('/matricula')
def matricula():
    return render_template('sitio/matricula.html')

@app.route('/admin/matricula', methods=['GET', 'POST'])
def admin_matricula():
    conn = get_db_connection()
    cursor = conn.cursor(pymysql.cursors.DictCursor)

    # Obtener la lista de estudiantes y sus matrículas
    cursor.execute("""
        SELECT a.idAlumno, a.Nombres, a.Apellidos, a.Documento, a.Sexo, m.idCurso, m.anio
        FROM alumnos a
        LEFT JOIN matriculas m ON a.idAlumno = m.idAlumno
    """)
    estudiantes = cursor.fetchall()

    conn.close()
    return render_template('admin/matricula.html', estudiantes=estudiantes)

@app.route('/admin/matricula/nuevo', methods=['GET', 'POST'])
def nuevo_estudiante():
    if request.method == 'POST':
        # Recoge los datos del formulario
        nombres = request.form['nombres']
        apellidos = request.form['apellidos']
        tipo_documento = request.form['tipo_documento']
        documento = request.form['documento']
        sexo = request.form['sexo']
        nacionalidad = request.form['nacionalidad']
        direccion = request.form['direccion']
        foto = 'None'
        nombre_acudiente = request.form['nombre_acudiente']
        documento_acudiente = request.form['documento_acudiente']
        fecha_nacimiento = request.form['fecha_nacimiento']
        telefono = request.form['telefono']
        correo_electronico = request.form['correo_electronico']
        
        # Conecta a la base de datos e inserta los datos
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("""
            INSERT INTO alumnos (Nombres, Apellidos, TipoDocumento, Documento, Sexo, Nacionalidad, Direccion, foto, NombreAcudiente, DocumentoAcudiente, FechaNacimiento, Telefono, CorreoElectronico)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """, (nombres, apellidos, tipo_documento, documento, sexo, nacionalidad, direccion, foto, nombre_acudiente, documento_acudiente, fecha_nacimiento, telefono, correo_electronico))
        
        conn.commit()
        conn.close()
        flash('Estudiante registrado exitosamente', 'success')
        return redirect(url_for('admin_matricula'))
    
    return render_template('admin/nuevo_estudiante.html')



@app.route('/admin/matricula/editar/<int:id>', methods=['GET', 'POST'])
def editar_estudiante(id):
    conn = get_db_connection()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    
    # Obtener los datos del estudiante
    cursor.execute("SELECT * FROM alumnos WHERE idAlumno = %s", (id,))
    estudiante = cursor.fetchone()
    
    if request.method == 'POST':
        # Actualizar los datos del estudiante
        nombres = request.form['nombres']
        apellidos = request.form['apellidos']
        tipo_documento = request.form['tipo_documento']
        documento = request.form['documento']
        sexo = request.form['sexo']
        nacionalidad = request.form['nacionalidad']
        direccion = request.form['direccion']
        foto = request.form['foto']
        nombre_acudiente = request.form['nombre_acudiente']
        documento_acudiente = request.form['documento_acudiente']
        fecha_nacimiento = request.form['fecha_nacimiento']
        telefono = request.form['telefono']
        correo_electronico = request.form['correo_electronico']
        
        cursor.execute("""
            UPDATE alumnos SET Nombres=%s, Apellidos=%s, TipoDocumento=%s, Documento=%s, Sexo=%s, Nacionalidad=%s, Direccion=%s, foto=%s, NombreAcudiente=%s, DocumentoAcudiente=%s, FechaNacimiento=%s, Telefono=%s, CorreoElectronico=%s
            WHERE idAlumno=%s
        """, (nombres, apellidos, tipo_documento, documento, sexo, nacionalidad, direccion, foto.filename, nombre_acudiente, documento_acudiente, fecha_nacimiento, telefono, correo_electronico, id))
        
        conn.commit()
        conn.close()
        flash('Estudiante actualizado exitosamente', 'success')
        return redirect(url_for('admin_matricula'))
    
    conn.close()
    return render_template('admin/editar_estudiante.html', estudiante=estudiante)

@app.route('/admin/eliminar_estudiante/<int:id>', methods=['POST'])
def eliminar_estudiante(id):
    conn = get_db_connection()
    try:
        with conn.cursor() as cursor:
            # Elimina el estudiante de la tabla 'matricula'
            sql_matricula = "DELETE FROM matriculas WHERE idAlumno = %s"
            cursor.execute(sql_matricula, (id,))
            
            # Elimina el estudiante de la tabla 'alumnos'
            sql_alumnos = "DELETE FROM alumnos WHERE idAlumno = %s"
            cursor.execute(sql_alumnos, (id,))
        
        # Confirma las eliminaciones
        conn.commit()
        flash("Estudiante eliminado con éxito.", "success")
    except Exception as e:
        flash("Error al eliminar el estudiante: " + str(e), "error")
    finally:
        conn.close()

    return redirect(url_for('admin_matricula'))



@app.route('/admin/grupos')
def admin_grupos():
    return render_template('admin/grupos.html')

@app.route('/admin/asignaturas')
def admin_asignaturas():
    return render_template('admin/asignaturas.html')

@app.route('/admin/calificaciones')
def admin_calificaciones():
    return render_template('admin/calificaciones.html')

@app.route('/admin/informes')
def admin_informes():
    return render_template('admin/informes.html')

@app.route('/admin/login2')
def login2():
    return render_template('admin/login2.html')


@app.route('/planeacion')
def planeacion():
    return render_template('sitio/planeacion.html')


@app.route('/calificaciones')
def calificaciones():
    return render_template('sitio/calificaciones.html')


@app.route('/informes')
def informes():
    return render_template('sitio/informes.html', name=informes)

"""
Funciones y enlaces para el admin
"""

@app.route('/admin2')
def admin_inicio():
    return render_template('admin/admin.html')


@app.route('/admin/institucion', methods=["GET"])
def admin_institucion():
    try:
        # Conectar a la base de datos
        cnx = pymysql.connect(**db_config)
        
        # Ejecutar consulta
        with cnx.cursor() as cursor:
            sql = """SELECT * FROM tabla_dev"""
            cursor.execute(sql)
            usuarios = cursor.fetchall()
    except pymysql.MySQLError as e:
        print("Error en la conexión a la base de datos:", e)
        usuarios = []
    finally:
        # Cerrar conexión
        if cnx:
            cnx.close()

    # Renderizar el template con la lista de usuarios
    return render_template('admin/institucion.html', lista_usuarios=usuarios)

@app.route('/admin/institucion/guardar', methods=['POST'])
def admin_institucion_guardar():
    _nombre = request.form['txtInstitucion']
    #cuando se reciben archivos se debe usar el metodo .files
    _imagen = request.files['txtImagen']
    _url = request.form['txtUrl']

    sql = """INSERT INTO `tabla_dev`(`id`,`dato1`, `dato2`, `dato3`) VALUES (NULL, %s,%s,%s) """
    datos = (_nombre, _imagen.filename, _url)
    #conexion a la base de datos
    cnx = pymysql.connect(**db_config)
    cursor = cnx.cursor()
    cursor.execute(sql, datos)
    cnx.commit()
    cnx.close()
    return redirect('/admin/institucion')

@app.route('/admin/institucion/borrar', methods=['POST'])
def admin_institucion_borrar():


    _nombre = request.form['txtId']
    sql = """DELETE FROM `tabla_dev` WHERE (`id`= %s) """
    datos = (_nombre)
    #conexion a la base de datos
    cnx = pymysql.connect(**db_config)
    cursor = cnx.cursor()
    cursor.execute(sql, datos)
    cnx.commit()
    cnx.close()
    return redirect('/admin/institucion')

@app.route('/admin/calendarios')
def admin_calendarios():
    return render_template('admin/calendarios.html')



############################################
def get_db_connection():
    return pymysql.connect(**db_config)

def init_db():
    conn = get_db_connection()
    try:
        with conn.cursor() as cursor:
            cursor.execute("""
                CREATE TABLE IF NOT EXISTS users (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    email VARCHAR(100) UNIQUE NOT NULL,
                    password VARCHAR(255) NOT NULL,
                    reset_token VARCHAR(100),
                    reset_token_expiry DATETIME
                )
            """)
        conn.commit()
    finally:
        conn.close()

@app.route('/admin')
def admin_home():
    if 'user_id' not in session:
        flash('Por favor, inicie sesión primero', 'error')
        return redirect(url_for('admin_login'))
    
    return render_template('admin/dashboard.html') 


# Función para obtener conexión a la base de datos
def get_db_connection():
    return pymysql.connect(
        host="127.0.0.1",
        user="root",
        password="920305_Becquet",
        database="proyecto",
        cursorclass=pymysql.cursors.DictCursor  # Esto permite obtener los resultados como diccionario
    )

@app.route('/admin/login', methods=['GET', 'POST'])
def admin_login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        
        conn = get_db_connection()
        try:
            with conn.cursor() as cursor:
                cursor.execute("SELECT * FROM users WHERE email = %s", (email,))
                user = cursor.fetchone()
                
                if user:
                    print("Usuario encontrado:")
                    print(f"ID: {user['id']}")
                    print(f"Email: {user['email']}")
                    print(f"Hash almacenado: {user['password']}")
                    
                    # Verificar la contraseña
                    try:
                        is_valid = check_password_hash(user['password'], password)
                        print(f"¿Contraseña válida?: {is_valid}")
                    except Exception as e:
                        print(f"Error al verificar contraseña: {str(e)}")
                        
                    if is_valid:
                        session['user_id'] = user['id']
                        session.permanent = True
                        flash('Inicio de sesión exitoso!', 'success')
                        return redirect(url_for('dashboard'))  # Redirigir al dashboard
                else:
                    print("Usuario no encontrado")
                    flash('Credenciales inválidas', 'error')
        finally:
            conn.close()
            
    return render_template('admin/login.html')

@app.route('/admin/register', methods=['GET', 'POST'])
def admin_register():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        confirm_password = request.form['confirm_password']
        
        if password != confirm_password:
            flash('Las contraseñas no coinciden', 'error')
            return redirect(url_for('admin_register'))
        
        try:
            hashed_password = generate_password_hash(password, method='pbkdf2:sha256')
            
            conn = get_db_connection()
            try:
                with conn.cursor() as cursor:
                    cursor.execute("""
                        INSERT INTO users (email, password) 
                        VALUES (%s, %s)
                    """, (email, hashed_password))
                conn.commit()
                flash('Registro exitoso! Por favor inicia sesión', 'success')
                return redirect(url_for('admin_login'))
            except pymysql.err.IntegrityError:
                flash('El email ya está registrado', 'error')
            finally:
                conn.close()
        except Exception as e:
            print(f"Error en registro: {str(e)}")
            flash('Error al procesar el registro', 'error')
            
    return render_template('admin/register.html')

@app.route('/admin/forgot-password', methods=['GET', 'POST'])
def admin_forgot_password():
    if request.method == 'POST':
        email = request.form['email']
        reset_token = secrets.token_urlsafe(32)
        
        conn = get_db_connection()
        try:
            with conn.cursor() as cursor:
                cursor.execute("""
                    UPDATE users 
                    SET reset_token = %s, 
                        reset_token_expiry = DATE_ADD(NOW(), INTERVAL 1 HOUR)
                    WHERE email = %s
                """, (reset_token, email))
            conn.commit()
            
            reset_url = url_for('admin_reset_password', token=reset_token, _external=True)
            msg = Message('Recuperación de Contraseña',
                         sender=app.config['MAIL_USERNAME'],
                         recipients=[email])
            msg.body = f'Para resetear tu contraseña, visita: {reset_url}'
            mail.send(msg)
            
            flash('Se ha enviado un correo con instrucciones para recuperar tu contraseña', 'success')
            return redirect(url_for('admin_login'))
        finally:
            conn.close()
            
    return render_template('admin/forgot_password.html')

@app.route('/admin/reset-password/<token>', methods=['GET', 'POST'])
def admin_reset_password(token):
    if request.method == 'POST':
        new_password = request.form['password']
        confirm_password = request.form['confirm_password']
        
        if new_password != confirm_password:
            flash('Las contraseñas no coinciden', 'error')
            return redirect(url_for('admin_reset_password', token=token))
        
        conn = get_db_connection()
        try:
            with conn.cursor() as cursor:
                cursor.execute("""
                    SELECT id FROM users 
                    WHERE reset_token = %s 
                    AND reset_token_expiry > NOW()
                """, (token,))
                user = cursor.fetchone()
                
                if user:
                    hashed_password = generate_password_hash(new_password)
                    cursor.execute("""
                        UPDATE users 
                        SET password = %s, 
                            reset_token = NULL, 
                            reset_token_expiry = NULL
                        WHERE id = %s
                    """, (hashed_password, user['id']))
                    conn.commit()
                    flash('Tu contraseña ha sido actualizada!', 'success')
                    return redirect(url_for('admin_login'))
                else:
                    flash('El token es inválido o ha expirado', 'error')
        finally:
            conn.close()
            
    return render_template('admin/reset_password.html')

@app.route('/admin/logout')
def admin_logout():
    session.clear()
    flash('Has cerrado sesión exitosamente', 'success')
    return redirect(url_for('admin_login'))


@app.route('/dashboard')
def dashboard():
    if 'user_id' not in session:
        flash('Por favor, inicie sesión primero', 'error')
        return redirect(url_for('admin_login'))
    
    # Redirige a la vista admin_institucion
    return redirect(url_for('admin_institucion'))





if __name__=='__main__':
    app.run(debug=True)