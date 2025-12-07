# Use Python base image
FROM python:3.10-slim

# Update and install ffmpeg + system tools
RUN apt-get update && apt-get install -y \
    ffmpeg \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set work directory
WORKDIR /app

# Copy project files
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port (Railway requires a port even if bot does not use HTTP)
EXPOSE 8080

# Run the bot
CMD ["python", "bot.py"]