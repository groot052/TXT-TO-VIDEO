#!/bin/bash

# Start Gunicorn in the background
gunicorn app:app &

# Start the Python script in the foreground
exec python3 main.py

# A more robust solution might use a process manager like supervisor.
# Here's an alternative using wait to ensure the container doesn't exit early
# until one of the background processes fails.
# gunicorn app:app &
# python3 main.py &
# wait -n
# exit $?
