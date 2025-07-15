# DON'T add anything here just add in render's secret or env section 
from os import environ

API_ID = int(environ.get("API_ID", "23274330"))
API_HASH = environ.get("API_HASH", "970e2e79779707c56d2b453b3a6eea48")
BOT_TOKEN = environ.get("BOT_TOKEN", "")
