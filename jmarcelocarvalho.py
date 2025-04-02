from flask import Flask, render_template, request
import csv
from dotenv import load_dotenv
import os

load_dotenv()

app = Flask(__name__)

#Variables
app.secret_key = os.getenv("FLASK_SECRET_KEY")
db_url = os.getenv("DATABASE_URL")

# Function to save form data to CSV
def save_to_csv(name, email, subject, message):
    with open('messages.csv', 'a', newline='') as file:
        writer = csv.writer(file)
        # Write header if file is empty
        if file.tell() == 0:
            writer.writerow(['Name', 'Email', 'Subject', 'Message'])
        writer.writerow([name, email, subject, message])

# Home route to handle form submission
@app.route("/", methods=["GET", "POST"])
def home():
    if request.method == "POST":
        name = request.form.get("name")
        email = request.form.get("email")
        subject = request.form.get("subject")
        message = request.form.get("message")

        # Print to console for debugging
        print(f"Name: {name}, Email: {email}, Subject: {subject}, Message: {message}")

        # Save to CSV
        save_to_csv(name, email, subject, message)

        # Render the template with a success message
        return render_template("index.html", success=True)

    return render_template("index.html")


# Additional routes for other pages
@app.route("/articles")
def articles():
    return render_template("articles.html")

@app.route("/cloud_resume_challenge")
def cloud_resume_challenge():
    return render_template("cloud_resume_challenge.html")

@app.route("/cloud_resume_challenge_2")
def cloud_resume_challenge_two():
    return render_template("cloud_resume_challenge_2.html")

@app.route("/projects")
def projects():
    return render_template("projects.html")

@app.route("/hobbies")
def hobbies():
    return render_template("hobbies.html")

if __name__ == "__main__":
    app.run(debug=True)

