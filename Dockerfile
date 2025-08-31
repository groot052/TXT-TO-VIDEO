# Use a currently supported Debian release
# 'bookworm-slim' is the current stable slim version
FROM python:3.10-slim-bookworm

# Set the working directory early to simplify paths
WORKDIR /app/

# Install system dependencies in a single layer for efficiency
# build-essential includes gcc and other necessary build tools
# We use a single RUN command to reduce image layers
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
    build-essential \
    libffi-dev \
    ffmpeg \
    aria2 \
    # Clean up after installation to keep the image size small
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy your application code
COPY . /app/

# Install Python dependencies in a single RUN command
# Combining this with the previous RUN is also an option, but this separation improves caching
RUN pip3 install --no-cache-dir --upgrade --requirement requirements.txt \
    && pip3 install --no-cache-dir pytube

# Expose the Gunicorn port
EXPOSE 8000

# The CMD command is the entrypoint for your container.
# It should run a single, foreground process.
# We will use a script to run both processes.
# This approach is not recommended, but if you must run both, a script is the way to do it.
# A better solution would be to use Docker Compose with two containers.
COPY start.sh .
RUN chmod +x ./start.sh
CMD ["./start.sh"]
