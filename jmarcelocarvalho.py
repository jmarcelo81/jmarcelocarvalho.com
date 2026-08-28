from flask import Flask, render_template, request, send_from_directory
from dotenv import load_dotenv
import csv, os, psycopg2


load_dotenv()

app = Flask(__name__)

#Variables
app.secret_key = os.getenv("FLASK_SECRET_KEY")
db_url = os.getenv("DATABASE_URL")

# Save contact from website to database
def save_to_db(name, email, subject, message):
    try:
        conn = psycopg2.connect(os.getenv("CONTACT_DB_URL"))
        cursor = conn.cursor()
        cursor.execute("""
            INSERT INTO messages (name, email, subject, message)
            VALUES (%s, %s, %s, %s)
        """, (name, email, subject, message))
        conn.commit()
        cursor.close()
        conn.close()
    except Exception as e:
        print("Database insert error:", e)

# Home route to handle form submission
@app.route("/", methods=["GET", "POST"])

def home():
    raise Exception("Intentional break for rollback drill")
    if request.method == "POST":
        name = request.form.get("name")
        email = request.form.get("email")
        subject = request.form.get("subject")
        message = request.form.get("message")

        # Save to Database
        save_to_db(name, email, subject, message)

        # Render the template with a success message
        return render_template("index.html", success=True)

    return render_template("index.html")


# Additional routes for robots and other pages

@app.route("/robots.txt")
def robots_txt():
    return send_from_directory(app.static_folder, "robots.txt")

@app.route("/articles")
def articles():
    return render_template("articles.html")

@app.route("/cloud_resume_challenge")
def cloud_resume_challenge():
    return render_template("cloud_resume_challenge.html")

@app.route("/projects")
def projects():
    return render_template("projects.html")

@app.route("/hobbies")
def hobbies():
    return render_template("hobbies.html")
