from flask import Flask, render_template, request, session
from web.db import WebProject
import json

def create_app():
    app = Flask(__name__)
    app.secret_key = 'secretkeys'
    wp = WebProject.instance()

    from .views import login_views, main_views, quest_views, myinfo_views
    app.register_blueprint(main_views.bp)
    app.register_blueprint(login_views.bp)
    app.register_blueprint(quest_views.bp)
    app.register_blueprint(myinfo_views.bp)

    @app.route('/runSQL', methods=['POST'])
    def run_sql():
        params = request.get_json()
        sql = params["query"]
        return wp.send_query(sql)

    @app.route('/connectSheet')
    def connectSheet():
        return json.dumps(wp.connect_sheet())

    @app.route('/connectForm')
    def connectForm():
        return json.dumps(wp.connect_form())

    @app.route('/getID')
    def get_ID():
        return session["id"]


    return app