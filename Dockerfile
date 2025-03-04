```Dockerfile
# Use the official Python image with version 3.9
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file into the working directory
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the working directory
COPY . .

# Command to run the application

CMD ["streamlit", "run", "app.py"]
```