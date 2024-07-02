# Team_5
## Инструкция для запуска

 1. Склонировать репозиторий `git clone https://github.com/KseniyaUnuchek/Team_5.git`
 2. Перейти в директорию `cd ./Team_5/airflow-environment`
 3. Выполнить команду `docker compose up airflow-init`, дождаться её выполнения
 4. Выполнить команду `docker compose up`
 5. По адресу http://localhost:8080/ будет UI Airflow

## Структура проекта

 - В папке [airflow-environment](https://github.com/KseniyaUnuchek/Team_5/tree/main/airflow-environment) лежит [docker-compose.yaml](https://github.com/KseniyaUnuchek/Team_5/blob/main/airflow-environment/docker-compose.yaml) для запуска Airflow в Docker
 - В папке [airflow-environment/dags](https://github.com/KseniyaUnuchek/Team_5/tree/main/airflow-environment/dags) лежат ДАГ-скрипты
 - - [test_db_connection.py](https://github.com/KseniyaUnuchek/Team_5/blob/main/airflow-environment/dags/test_db_connection.py) - ДАГ, проверяющий соединение с БД source и считывающий данные из таблицы "инструменты"
