FROM python:3.12-slim

RUN mkdir events_service
WORKDIR /events_service

COPY /pyproject.toml /events_service

RUN pip3 install poetry

RUN poetry config virtualenvs.create false \
    && poetry install --no-dev --no-interaction --no-ansi

COPY . .

CMD ["sh", "-c", "poetry run python src/main.py"]



