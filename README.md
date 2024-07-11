# Team_5
## Инструкция для запуска

 1. Склонировать репозиторий `git clone https://github.com/KseniyaUnuchek/Team_5.git`
 2. Перейти в директорию `cd ./Team_5/airflow-environment`
 3. Выполнить команду `docker compose up airflow-init`, дождаться её выполнения
 4. Выполнить команду `docker compose up`
 5. По адресу http://localhost:8080/ будет UI Airflow

## Структура проекта

 - В папке [airflow-environment](https://github.com/KseniyaUnuchek/Team_5/tree/main/airflow-environment) лежит [docker-compose.yaml](https://github.com/KseniyaUnuchek/Team_5/blob/main/airflow-environment/docker-compose.yaml) для запуска Airflow в Docker
 - В папке [airflow-environment/dags](https://github.com/KseniyaUnuchek/Team_5/tree/main/airflow-environment/dags) лежат ДАГи
 - В папке [airflow-environment/dags/scripts](https://github.com/KseniyaUnuchek/Team_5/tree/main/airflow-environment/dags/scripts) лежат исполняемые python-скрипты
 - В папке [airflow-environment/dags/sql](https://github.com/KseniyaUnuchek/Team_5/tree/main/airflow-environment/dags/sql) лежат исполняемые SQL-скрипты.
 ___
 Структура хранения кода ДАГов и исполняемых скриптов:
  - [fill_ods_layer.py](https://github.com/KseniyaUnuchek/Team_5/blob/main/airflow-environment/dags/fill_ods_layer.py) - ДАГ, формирующий и заполняющий  ODS-cлой данными "as is" из источника
 - -  Исполняемые скрипты:
 - - - [fill_data.py](https://github.com/KseniyaUnuchek/Team_5/blob/main/airflow-environment/dags/scripts/fill_data.py)
- - - [create_table.py](https://github.com/KseniyaUnuchek/Team_5/blob/main/airflow-environment/dags/scripts/create_table.py)
- - - [create_tables_ods.sql]()
- - - [truncate_tables.sqll]()
 - [fill_dds_layer.py](airflow-environment/dags/fill_dds_layer.py) - ДАГ, формирующий и заполняющий DDS-слой данными в соответствии с ER-диаграммой
 - - Исполняемые скрипты:
 - - - [fill_data.py](https://github.com/KseniyaUnuchek/Team_5/blob/main/airflow-environment/dags/scripts/fill_data.py)
- - - [create_table.py](https://github.com/KseniyaUnuchek/Team_5/blob/main/airflow-environment/dags/scripts/create_table.py)
- - - [fill_dds_tables.py](https://github.com/KseniyaUnuchek/Team_5/blob/main/airflow-environment/dags/scripts/fill_dds_tables.py)
- - - [create_tables_dds.sql](https://github.com/KseniyaUnuchek/Team_5/blob/main/airflow-environment/dags/sql/create_tables_dds.sql)
- - - [truncate_tables_dds.sql](https://github.com/KseniyaUnuchek/Team_5/blob/main/airflow-environment/dags/sql/truncate_tables_dds.sql)
- - - [fill_dds_catalogs.sqll](https://github.com/KseniyaUnuchek/Team_5/blob/main/airflow-environment/dags/sql/fill_dds_catalogs.sql)
- - - [fill_dds_skills.sql](https://github.com/KseniyaUnuchek/Team_5/blob/main/airflow-environment/dags/sql/ill_dds_skills.sqll)
- - - [fill_dds_levels.sql](https://github.com/KseniyaUnuchek/Team_5/blob/main/airflow-environment/dags/sql/ill_dds_levels.sql)
- - - [fill_dds_employees.sql](https://github.com/KseniyaUnuchek/Team_5/blob/main/airflow-environment/dags/sql/fill_dds_employees.sql)
- - - [fill_dds_cv_dar.sql](https://github.com/KseniyaUnuchek/Team_5/blob/main/airflow-environment/dags/sql/fill_dds_cv_dar.sql)
- - - [fill_dds_skills_levels.sql](https://github.com/KseniyaUnuchek/Team_5/blob/main/airflow-environment/dags/sql/fill_dds_skills_levels.sql)