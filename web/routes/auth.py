from flask import Blueprint, render_template, request, redirect, url_for, flash, session
import bcrypt
from main import get_db_connection

bp = Blueprint('auth', __name__)

@bp.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')

        connection = get_db_connection()
        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM Uzivatel WHERE uzivatelske_jmeno = %s", (username,))
            user = cursor.fetchone()

        if user and bcrypt.checkpw(password.encode('utf-8'), user['heslo_hash'].encode('utf-8')):
            session['user_id'] = user['id_uzivatele']
            flash('Logged in successfully!', 'success')
            return redirect(url_for('packages.packages'))

        flash('Login failed. Check your username and password.', 'danger')
    
    return render_template('login.html')

@bp.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        first_name = request.form.get('first_name')
        last_name = request.form.get('last_name')
        username = request.form.get('username')
        password = request.form.get('password')
        email = request.form.get('email')
        phone = request.form.get('phone', None)
        hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())

        connection = get_db_connection()
        with connection.cursor() as cursor:
            cursor.execute("SELECT id_klienta FROM Klient WHERE email = %s", (email,))
            client = cursor.fetchone()

            if client:
                id_klienta = client['id_klienta']
            else:
                cursor.execute(
                    "INSERT INTO Klient (jmeno, prijmeni, email, telefon) VALUES (%s, %s, %s, %s)",
                    (first_name, last_name, email, phone)
                )
                connection.commit()
                id_klienta = cursor.lastrowid

            try:
                cursor.execute(
                    "INSERT INTO Uzivatel (uzivatelske_jmeno, heslo_hash, id_klienta) VALUES (%s, %s, %s)",
                    (username, hashed_password.decode('utf-8'), id_klienta)
                )
                connection.commit()
                flash('Registration successful! You can now log in.', 'success')
            except Exception as e:
                flash(f'Registration failed: {str(e)}', 'danger')
        
        return redirect(url_for('auth.login'))
    
    return render_template('register.html')

@bp.route('/logout')
def logout():
    session.clear()
    flash('You have been logged out successfully.', 'success')
    return redirect(url_for('auth.login'))