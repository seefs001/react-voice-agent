# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Install uv
RUN pip install uv

# Set the working directory to /app/server
WORKDIR /app/server

# Make port 3000 available to the world outside this container
EXPOSE 3000

# Run app.py using uv when the container launches
CMD ["uv", "run", "src/server/app.py"]