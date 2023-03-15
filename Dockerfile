# FROM python:3.10

# # Set the working directory to /app
# WORKDIR /app

# # Copy the current directory contents into the container at /app
# COPY . /app

# # Install any needed packages specified in requirements.txt
# RUN pip install --no-cache-dir -r requirements.txt

# # Run database migrations
# RUN python manage.py makemigrations
# RUN python manage.py migrate

# # Create a superuser
# RUN echo "from django.contrib.auth.models import User; User.objects.create_superuser('limon', 'sorkerlimon18@gmail.com', 'limon@123')" | python manage.py shell

# # Expose port 8000
# EXPOSE 8000

# # Set environment variables
# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1

# # Run the command to start the Django server
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]


# Base image
FROM python:3.10

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Run database migrations
RUN python manage.py makemigrations
RUN python manage.py migrate

# Collect static files
RUN python manage.py collectstatic --noinput

# Create a superuser
RUN echo "from django.contrib.auth.models import User; User.objects.create_superuser('sorkerlimon1', 'sorkerlimon19@gmail.com', 'limon@123')" | python manage.py shell

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Expose port 8000 (Django development server)
EXPOSE 8000

# Start the Django development server
CMD python manage.py runserver 0.0.0.0:8000
