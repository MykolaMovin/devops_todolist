ARG PYTHON_VERSION=3.8

FROM python:${PYTHON_VERSION} AS base
WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

ENV APP_ENV="stage"
ENV PYTHONUNBUFFERED=1

EXPOSE 8080

ENTRYPOINT ["python", "manage.py", "runserver"]
CMD ["0.0.0.0:8080"]