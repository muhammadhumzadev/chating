# Use an official Python runtime as a parent image
FROM python:3.10-slim-buster

# Set the working directory in the container
WORKDIR /ct

# Copy the current directory contents into the container at /app
COPY . /ct

# Install any needed packages specified in requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

RUN export PATH="/root/.local/bin:$PATH" && \
    python3 /ct/manage.py makemigrations

RUN export PATH="/root/.local/bin:$PATH" && \
    python3 /ct/manage.py migrate

# Make port 8000 available to the world outside this container
EXPOSE 3000

# Run the command to start uWSGI
CMD ["python3", "/ct/manage.py", "runserver", "0.0.0.0:3000"]
