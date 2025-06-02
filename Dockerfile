# Use an official Python slim image as the base
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file if you have one.
# If you haven't created one, you can install Flask directly (and any other packages)
# For now, let's assume you list your dependencies in a requirements.txt file.
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code
COPY . .

# Set environment variables for Flask
# (Assuming your main file is jmarcelocarvalho.py)
ENV FLASK_APP=jmarcelocarvalho.py
ENV FLASK_RUN_HOST=0.0.0.0

# Expose port 5000 (the default port Flask uses)
EXPOSE 5000

# Command to run the Flask app
CMD ["gunicorn", "-b", "0.0.0.0:5000", "jmarcelocarvalho:app"]

