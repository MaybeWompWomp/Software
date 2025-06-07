from flask import Blueprint, render_template, request, redirect, url_for, flash, session
from main import get_db_connection

bp = Blueprint('reviews', __name__, url_prefix='/reviews')

@bp.route('/<int:package_id>', methods=['GET'])
def view_reviews(package_id):
    connection = get_db_connection()
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM Recenze WHERE id_zajezdu = %s", (package_id,))
        reviews = cursor.fetchall()
    return render_template('reviews.html', reviews=reviews, package_id=package_id)

@bp.route('/submit/<int:package_id>', methods=['POST'])
def submit_review(package_id):
    if 'user_id' not in session:
        flash('You must be logged in to write a review.', 'danger')
        return redirect(url_for('auth.login'))

    hodnoceni = request.form.get('hodnoceni')
    text = request.form.get('text')
    id_klienta = session['user_id']

    connection = get_db_connection()

    with connection.cursor() as cursor:
        try:
            cursor.execute(
                "INSERT INTO Recenze (id_klienta, id_zajezdu, hodnoceni, text, datum) VALUES (%s, %s, %s, %s, CURDATE())",
                (id_klienta, package_id, hodnoceni, text)
            )
            connection.commit()
            flash('Review submitted successfully!', 'success')
            return redirect(url_for('reviews.view_reviews', package_id=package_id))
        except Exception as e:
            flash(f'Review submission failed: {str(e)}', 'danger')

    return redirect(url_for('reviews.view_reviews', package_id=package_id))