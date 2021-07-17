# Basic Flask app container to test docker-compose, ouroboros, etc with

# Specifiy the version of base image and python to be used
FROM python:3.7-alpine

# Set and create the working directory for our application in the container image
WORKDIR /app

# Add the packages needed for Flask to run in Alpine-Linux
RUN apk add --no-cache gcc musl-dev linux-headers

# Explicitly expose the port we will serve flask on
EXPOSE 5000

# Add the requirements file and install them
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Set some sane defaults for environment variables - can be overridden from the commandline
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_ENV=${FLASK_ENV:-development}

# Copy the application files into the WORKDIR 
ADD app/ .

CMD ["flask", "run"]
