from flask import Blueprint, render_template, redirect, url_for, session, flash
from main import get_db_connection

bp = Blueprint('packages', __name__)

@bp.route('/packages')
def packages():
    if 'user_id' not in session:
        flash('You must be logged in to view packages.', 'danger')
        return redirect(url_for('auth.login')) 

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
                u.id_ubytovani,
                u.nazev AS accommodation_name,
                u.typ,
                u.adresa,
                u.hodnoceni,
                p.jmeno AS guide_name,
                p.prijmeni AS guide_lastname,
                p.jazyk AS guide_language,
                p.telefon AS guide_phone
            FROM 
                Zajezd z
            LEFT JOIN 
                UbytovaniNaZajezdu uz ON z.id_zajezdu = uz.id_zajezdu
            LEFT JOIN 
                Ubytovani u ON uz.id_ubytovani = u.id_ubytovani
            LEFT JOIN 
                PruvodceNaZajezdu pn ON z.id_zajezdu = pn.id_zajezdu
            LEFT JOIN 
                Pruvodce p ON pn.id_pruvodce = p.id_pruvodce
        """

        cursor.execute(query)

        packages_data = cursor.fetchall()

    return render_template('packages.html', packages=packages_data)