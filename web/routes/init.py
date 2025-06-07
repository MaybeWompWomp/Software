from flask import Blueprint

bp = Blueprint('main', __name__)

from .home import bp as home_bp
from .packages import bp as packages_bp
from .booking import bp as booking_bp
from .auth import bp as auth_bp
from .reviews import bp as reviews_bp
from .users import bp as users_bp

bp.register_blueprint(home_bp)
bp.register_blueprint(packages_bp)
bp.register_blueprint(booking_bp)
bp.register_blueprint(auth_bp)
bp.register_blueprint(reviews_bp)
bp.register_blueprint(users_bp)