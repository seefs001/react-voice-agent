# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install uv
RUN pip install uv

# Install any needed packages specified in requirements.txt
RUN uv pip install -r requirements.txt

# Make port 3000 available to the world outside this container
EXPOSE 3000

# Define environment variables

# Run app.py when the container launches
CMD ["uv", "run", "src/server/app.py"]