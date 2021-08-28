FROM python:3.9-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

# обновление и установка нужных пакетов
RUN apk --update add
RUN apk add gcc libc-dev libffi-dev jpeg-dev zlib-dev libjpeg
RUN apk add postgresql-dev

# обновление pip
RUN pip install --upgrade pip

# копирование файла
COPY ./requirements.txt .

RUN pip install -r requirements.txt

# копирование всего проекта в app
COPY . .
# путь до ентрипоинта
ENTRYPOINT ["/app/entrypoint.sh"]