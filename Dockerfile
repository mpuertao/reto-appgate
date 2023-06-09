# Use an official Python runtime as a parent image
FROM python:3.9-slim-buster

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install all needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port that Flask will be running on
EXPOSE 8000

# Start Gunicorn with 4 workers
CMD ["gunicorn", "main:app", "-w", "4", "-b", "0.0.0.0:8000"]
