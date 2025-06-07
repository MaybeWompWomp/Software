import pymysql
import os
import ssl
import importlib
from flask import Flask, current_app, render_template
from dotenv import load_dotenv

load_dotenv()

app = Flask(__name__)
app.secret_key = os.getenv('FLASK_SECRET_KEY')

def init_db():
    app.config['MYSQL_HOST'] = os.getenv('MYSQL_HOST')
    app.config['MYSQL_USER'] = os.getenv('MYSQL_USER')
    app.config['MYSQL_PASSWORD'] = os.getenv('MYSQL_PASSWORD')
    app.config['MYSQL_DB'] = os.getenv('MYSQL_DB')

    print("[DEBUG] Attempting to connect to the database...")

    try:
        connection = get_db_connection()
        with connection.cursor() as cursor:
            cursor.execute("SELECT VERSION()")
            version = cursor.fetchone()
            print(f"[DEBUG] Successfully connected to MySQL. Server version: {version['VERSION()']}")
        connection.close()
    except Exception as e:
        print(f"[ERROR] Failed to connect to the database: {e}")

def get_db_connection():
    return pymysql.connect(
        host=current_app.config['MYSQL_HOST'],
        user=current_app.config['MYSQL_USER'],
        password=current_app.config['MYSQL_PASSWORD'],
        database=current_app.config['MYSQL_DB'],
        charset='utf8mb4',
        cursorclass=pymysql.cursors.DictCursor
    )

def load_routes():
    routes_folder = os.path.join(os.path.dirname(__file__), 'routes')

    for filename in os.listdir(routes_folder):
        if filename.endswith(".py") and filename != "__init__.py":
            module_name = f'routes.{filename[:-3]}'
            module = importlib.import_module(module_name)
            app.register_blueprint(module.bp)

def init_ssl():
    cert_file = "/home/container/certs/fullchain.pem"
    key_file = "/home/container/certs/privkey.pem"
    context = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
    context.load_cert_chain(certfile=cert_file, keyfile=key_file)
    return context

@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404

if __name__ == "__main__":
    with app.app_context():
        init_db()
    load_routes()
    context = init_ssl()
    app.run(host="0.0.0.0", port=30000, ssl_context=context, debug=True)