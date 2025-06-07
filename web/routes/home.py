from flask import Blueprint, render_template
from main import get_db_connection

bp = Blueprint('home', __name__)

@bp.route('/')
def index():
    connection = get_db_connection()
    with connection.cursor() as cursor:
        query = """
            SELECT 
                z.id_zajezdu,
                z.nazev AS package_name,
                z.destinace,
                z.datum_odjezdu,
                z.datum_prijezdu,
                z.cena,
                AVG(r.hodnoceni) AS average_rating
            FROM 
                Zajezd z
            LEFT JOIN 
                Recenze r ON z.id_zajezdu = r.id_zajezdu
            GROUP BY 
                z.id_zajezdu
        """
        cursor.execute(query)
        packages_data = cursor.fetchall()

    return render_template('home.html', packages=packages_data)