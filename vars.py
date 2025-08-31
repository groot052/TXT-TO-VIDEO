# DON'T add anything here just add in render's secret or env section 
from os import environ

API_ID = int(environ.get("API_ID", "20531922"))
API_HASH = environ.get("API_HASH", "1281c125a3e908948a9a64a58099a2f3")
BOT_TOKEN = environ.get("BOT_TOKEN", "")

