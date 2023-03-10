from flask import Blueprint, render_template, redirect, url_for, request, session,flash, g
from werkzeug.security import generate_password_hash, check_password_hash
from ..db import WebProject
from ..form import RegisterForm, LoginForm
from werkzeug.utils import redirect


bp = Blueprint('login', __name__, url_prefix='/login')
wp = WebProject.instance()
# 로그인
@bp.route('/', methods=['GET', 'POST'])
def login_page():
    form = LoginForm()
    if request.method == 'POST' and form.validate_on_submit(): 
        # 각 id랑 psw가 맞는지.
        userid = request.form['userid']
        userpw = request.form['userpw']

        is_exist = wp.send_query("SELECT EXISTS (SELECT id FROM user WHERE id = '{}') AS success".format(userid))

        if (is_exist[0]["success"]):
            user_pwd = wp.send_query("SELECT pwd FROM user WHERE id = '{}'".format(userid))
            if check_password_hash(user_pwd[0]['pwd'],userpw):
                session['logged_in'] = True
                session['id'] = userid
                return redirect(url_for("main.main_page"))
            else:
                flash('비밀번호 틀림')
                return redirect(url_for("login.login_page"))
        else:
            flash('존재하지 않는 아이디')
            return redirect(url_for("login.login_page"))
    else:
        # 이게 필요 하다.
        session['logged_in'] = False
        return render_template('login/login_page.html', form = form)

# 회원 가입
@bp.route('/register', methods=['GET', 'POST'])
def register_page():
    form = RegisterForm()
    if request.method == 'POST' and form.validate_on_submit():
        # real_name이 character name일 듯
        username= request.form['username']
        userid= request.form['userid']
        userpw= request.form['userpw']
        is_exist = wp.send_query("SELECT EXISTS (SELECT id FROM user WHERE id = '{}') AS success".format(userid))

        # 1. name이 같나 확인한다. (기존 db에서)
        if (is_exist[0]["success"]):
            # 2. 같으면 x 다시 돌아가게
            # 다시 돌아가게 짠다.
            flash('별명을 다시 입력하세요!','success')
            return redirect(url_for("login.register_page"))
        else:
            # 3. 다르면 그냥 회원가입 하게?? 가 맞는듯?
            # + db에 추가 하고 '/' 라우트로 이동.
            wp.send_query("INSERT INTO user(id, pwd, name) VALUES ('{}', '{}', '{}')".format(userid, generate_password_hash(userpw), username), commit=True)
            return redirect(url_for("login.login_page"))
    else:
        return render_template('login/register_page.html', form = form)
# 이용 약관
@bp.route('/terms', methods=['GET', 'POST'])
def terms():
    term_dict={}
    terms1 = wp.send_query("SELECT * FROM notice_board where title ='{}'".format('이용약관'))
    terms2 = wp.send_query("SELECT * FROM notice_board where title ='{}'".format('개인정보 취급방침'))
    term_dict['ret1'] = terms1[0]
    term_dict['ret2'] = terms2[0]
    return render_template('login/terms.html', terms = term_dict)

# 별명 회원가입 찾기
@bp.route('/find', methods=['GET','POST'])
def finder():
    if request.method == 'POST':
        if not (request.form['name']) or not (request.form['pwd']):
            flash('내용이 비어 있습니다.')
            return redirect(url_for('login.finder'))
        else:
            name = wp.send_query("SELECT id FROM user where name = '{}'".format(request.form['name']))
            if not (name):
                flash('내용이 틀림')
                return redirect(url_for('login.finder'))
            else:
                flash("별명은 {} 입니다.".format(name[0]['id']))            
                return redirect(url_for('login.login_page'))
    else:
        return render_template('login/find_id.html')

# 로그아웃
@bp.route('/logout/')
def logout():
    session.clear()
    session['logged_in'] = False
    return redirect(url_for("main.main_page"))

# 탈퇴
@bp.route('/withdraw/')
def withdraw():
    wp.send_query("DELETE from user where id='{}'".format(g.user['user_id']),commit=True)
    wp.send_query("DELETE from daily where user_id='{}'".format(g.user['user_id']),commit=True)
    wp.send_query("DELETE from solving where user_id='{}'".format(g.user['user_id']),commit=True)
    wp.send_query("DELETE from todo where user_id='{}'".format(g.user['user_id']),commit=True)
    return redirect(url_for("login.login_page"))



# 실행 전
@bp.before_app_request  
def load_logged_in_user():
    log = session.get('logged_in')
    if log:
        g.user = {'user_id': session.get('id')}
    else:
        g.user = None

