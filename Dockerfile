# Basic Flask app container to test docker-compose, ouroboros, etc with

# Specifiy the version of base image and python to be used
FROM python:3.7-alpine

# Set and create the working directory for our application
WORKDIR /app

# Set some sane defaults for environment variables - can be overridden from the commandline
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Add the packages needed for Flask to run in Alpine-Linux
RUN apk add --no-cache gcc musl-dev linux-headers

# Explicitly expose the port we will serve flask on
EXPOSE 5000

# Add the requirements file and install them
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Copy the application files in 
ADD app/ .

CMD ["flask", "run"]
