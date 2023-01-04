from flask import Flask, render_template, request, session, redirect, url_for, flash
from flask_sqlalchemy import SQLAlchemy
from flask_login import UserMixin
from werkzeug.security import generate_password_hash, check_password_hash
from flask_login import login_user, logout_user, login_manager, LoginManager
from flask_login import login_required, current_user

local_server = True
app = Flask(__name__)
app.secret_key = 'DBMS'

# this is for getting unique user access
login_manager = LoginManager(app)
login_manager.login_view = 'login'


@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))


app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:@localhost/nextgen'
db = SQLAlchemy(app)


# here we will create db models that is tables
class User(UserMixin, db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(50))
    contact = db.Column(db.String(20))
    email = db.Column(db.String(50), unique=True)
    password = db.Column(db.String(100))

class Booking(db.Model):
    pid = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50))
    email = db.Column(db.String(50))
    contact = db.Column(db.String(50))
    gender = db.Column(db.String(50))
    slot = db.Column(db.String(50))
    date = db.Column(db.String(50), nullable=False)
    time = db.Column(db.String(50), nullable=False)
    doctor = db.Column(db.String(50))



@app.route('/')
def fun():
    return render_template('index.html')


@app.route('/doctors')
def doctors():
    return render_template('doctors.html')

@app.route('/patients')
def patients():
    query = db.engine.execute("SELECT * FROM `booking`")
    return render_template('patients.html', query=query)

@app.route("/delete/<string:pid>", methods=['POST', 'GET'])
def delete(pid):
    db.engine.execute(f"DELETE FROM `booking` WHERE `booking`.`bookingid`={pid}")
    flash("Slot Deleted Successfully", "danger")
    return redirect('/patients')

@app.route('/booking', methods=['POST', 'GET'])
def booking():
    if request.method == "POST":
        name = request.form.get('name')
        if request.form.get('email') == "":
            email = current_user.email
        else:
            email = request.form.get('email')

        if request.form.get('number') == "":
            contact = current_user.contact
        else:
            contact = request.form.get('number')
        gender = request.form.get('gender')
        slot = request.form.get('slot')
        date = request.form.get('date')
        time = request.form.get('time')
        doc = request.form.get('doc')
        subject = "HOSPITAL MANAGEMENT SYSTEM"
        query = db.engine.execute(
            f"INSERT INTO `booking` (`name`,`email`,`contact`,`gender`,`slot`,`date`,`time`,`doctor`) VALUES ('{name}','{email}','{contact}','{gender}','{slot}','{date}','{time}','{doc}')")
        flash("Booking Successful", "success")
    return render_template('booking.html', username=current_user.username, contact=current_user.contact, email=current_user.email)


@app.route("/signup", methods=["GET", "POST"])
def add():

    if request.method == "POST":
        email = request.form.get('email')
        contact = request.form.get('number')
        password = request.form.get('password')
        username = request.form.get('username')
        user = User.query.filter_by(email=email).first()
        if email == "" or contact == "" or password == "" or username == "":
            flash("Don't leave any fields empty!", "warning")
            return render_template('/signup.html')
        elif user:
            flash("Email Already Exist", "warning")
            return render_template('/signup.html')

        new_user = db.engine.execute(
            f"INSERT INTO `user` (`contact`,`username`,`email`,`password`) VALUES ('{contact}','{username}','{email}','{password}')")

        flash("Signup Success Please Login", "success")

    return render_template("signup.html")


@app.route("/signin", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        email = request.form.get('email')
        password = request.form.get('password')
        user = User.query.filter_by(email=email).first()

        if user and password == user.password:
            login_user(user)
            return redirect(url_for('booking'))
        else:
            flash("Invalid Credentials", "danger")
            return render_template('signin.html')

    return render_template('signin.html')

app.run(debug=True)
