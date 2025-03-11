```Dockerfile
# Use an appropriate base image with both Python and R pre-installed
FROM rocker/r-ver:4.3.1

# Set environment variables for R and Python installations
ENV PYTHONUNBUFFERED=1
ENV APP_HOME=/app

# Install Python3 and pip 
RUN apt-get update && apt-get install -y python3 python3-pip

# Set the working directory in the container
WORKDIR $APP_HOME

# Copy the application's requirement files
COPY Requirements.txt requirements.txt

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the rest of the application code to the container
COPY . .

# Expose Flask's default port
EXPOSE 5000

# Set the entry point for the container
CMD ["python3", "app.py"]
```