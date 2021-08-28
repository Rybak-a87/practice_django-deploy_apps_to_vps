#!/usr/bin/env sh

python manage.py migrate

gunicorn report_page.config.wsgi:applicaton -bind 0.0.0.0:8000 --reload -w 4