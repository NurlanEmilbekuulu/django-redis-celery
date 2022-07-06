FROM python:3
ENV PYTHONUNBUFFERED=1
WORKDIR /usr/src/app

RUN apt update && apt -y install libpq-dev python3-dev gcc

COPY requirements.txt ./

RUN pip wheel --no-cache-dir --no-deps --wheel-dir /usr/src/app/wheels -r requirements.txt && \
    pip install --upgrade --no-cache pip && pip install --no-cache /usr/src/app/wheels/*