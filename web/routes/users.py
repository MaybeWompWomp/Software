from flask import Blueprint, render_template, redirect, url_for

bp = Blueprint('users', __name__)

@bp.route('/profile')
def profile():
    return render_template('profile.html')