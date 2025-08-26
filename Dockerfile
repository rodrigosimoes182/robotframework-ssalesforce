# Use official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements if present, else install robotframework directly
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt || pip install --no-cache-dir robotframework

# Copy project files
COPY . .

# Default command to run all Robot Framework tests in the current directory
CMD ["robot", "--outputdir", "results", "--loglevel", "TRACE", "--report", "NONE", "--log", "NONE", "--exclude", "smoke", "--include", "regression", "--dryrun", "tests/"]