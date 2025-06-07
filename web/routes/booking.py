from flask import Blueprint, request, render_template, redirect, url_for, flash

bp = Blueprint('booking', __name__)

@bp.route('/book/<int:package_id>', methods=['GET', 'POST'])
def book(package_id):
    if request.method == 'POST':
        user_id = request.form.get('user_id')
        num_people = request.form.get('num_people')
        connection = current_app.get_db_connection()
        with connection.cursor() as cursor:
            cursor.execute("INSERT INTO Rezervace (id_klienta, id_zajezdu, datum_rezervace, pocet_osob, stav) VALUES (%s, %s, NOW(), %s, 'Pending')", 
                           (user_id, package_id, num_people))
            connection.commit()

        flash('Booking successful!', 'success')
        return redirect(url_for('packages.packages'))

    return render_template('booking.html', package_id=package_id)