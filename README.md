# Team_5
## Инструкция для запуска

 1. Склонировать репозиторий `git clone https://github.com/KseniyaUnuchek/Team_5.git`
 2. Перейти в директорию `cd ./Team_5`
 3. Выполнить команду `docker compose up`
 4. По адресу http://localhost:8080/ будет UI Airflow

## Структура проекта

 - В корне проекта лежит [docker-compose.yaml](https://github.com/KseniyaUnuchek/Team_5/blob/main/docker-compose.yaml) для запуска Airflow в Docker
 - В папке [dags](https://github.com/KseniyaUnuchek/Team_5/tree/main/dags) лежат ДАГи
 - В папке [dags/scripts](https://github.com/KseniyaUnuchek/Team_5/tree/main/dags/scripts) лежат исполняемые python-скрипты
 - В папке [dags/sql](https://github.com/KseniyaUnuchek/Team_5/tree/main/dags/sql) лежат исполняемые SQL-скрипты.
 ___
 Структура хранения кода ДАГов и исполняемых скриптов:
  - [dag_orchestrator.py](dags/dag_orchestrator.py) - ДАГ, запускающий ДАГи для создания и заполнения [ODS](dags/fill_ods_layer.py), [DDS](dags/fill_dds_layer.py), [DM](dags/fill_dm_layer.py), [DM2](dags/fill_dm2_layer.py) слоев в соответствии с расписанием
  - [fill_ods_layer.py](dags/fill_ods_layer.py) - ДАГ, формирующий и заполняющий  ODS-cлой (ods_ksusha) данными "as is" из источника
 - -  Исполняемые скрипты:
 - - - [fill_data.py](dags/scripts/fill_data.py)
- - - [create_table.py](dags/scripts/create_table.py)
- - - [create_tables_ods.sql](dags/sql/create_tables_ods.sql)
- - - [truncate_tables.sql](dags/sql/truncate_tables.sql)
 - [fill_dds_layer.py](dags/fill_dds_layer.py) - ДАГ, формирующий и заполняющий DDS-слой(dds_ksusha) данными в соответствии с ER-диаграммой, а так же одновременно заполняющий слой-копию с ошибочными данными (bad_dds_ksusha)
 - - Исполняемые скрипты:
 - - - [fill_data.py](dags/scripts/fill_data.py)
- - - [create_table.py](dags/scripts/create_table.py)
- - - [fill_tables.py](dags/scripts/fill_tables.py)
- - - [create_tables_dds.sql](dags/sql/create_tables_dds.sql)
- - - [truncate_tables_dds.sql](dags/sql/truncate_tables_dds.sql)
- - - [fill_dds_catalogs.sql](dags/sql/fill_dds_catalogs.sql)
- - - [fill_dds_skills.sql](dags/sql/ill_dds_skills.sqll)
- - - [fill_dds_levels.sql](dags/sql/ill_dds_levels.sql)
- - - [fill_dds_employees.sql](dags/sql/fill_dds_employees.sql)
- - - [fill_dds_cv_dar.sql](dags/sql/fill_dds_cv_dar.sql)
- - - [fill_dds_skills_levels.sql](dags/sql/fill_dds_skills_levels.sql)
- [fill_dm_layer.py](dags/fill_dm_layer.py) - ДАГ, формирующий и заполняющий DM-слой(dm_ksusha) данными в соответствии с постановкой от аналитиков
- -  Исполняемые скрипты:
 - - - [fill_data.py](dags/scripts/fill_data.py)
- - - [create_table.py](dags/scripts/create_table.py)
- - - [fill_tables.py](dags/scripts/fill_tables.py)
- - - [create_tables_dm.sql](dags/sql/create_tables_dm.sql)
- - - [truncate_tables_dm.sql](dags/sql/truncate_tables_dm.sql)
- - - [fill_dm_now.sql](dags/sql/fill_dm_now.sql)
- - - [fill_dm_compare.sql](dags/sql/fill_dm_compare.sql)
- - - [fill_dm_total_change.sql](dags/sql/fill_dm_total_change.sql)
- - - [fill_dm_complex_data.sql](dags/sql/fill_dm_complex_data.sql)
- - - [fill_dm_catalogs.sql](dags/sql/fill_dm_catalogs.sql)
- - - [fill_dm_employees_statistic.sql](dags/sql/fill_dm_employees_statistic.sql)
- [fill_dm2_layer.py](dags/fill_dm2_layer.py) - ДАГ, формирующий и заполняющий DM2-слой(dm_ksusha) данными в соответствии с постановкой от аналитиков
- -  Исполняемые скрипты:
 - - - [fill_data.py](dags/scripts/fill_data.py)
- - - [create_table.py](dags/scripts/create_table.py)
- - - [fill_tables.py](dags/scripts/fill_tables.py)
- - - [create_tables_dm2.sql](dags/sql/create_tables_dm2.sql)
- - - [truncate_tables_dm2.sql](dags/sql/truncate_tables_dm2.sql)
- - - [fill_dm2_catalogs.sql](dags/sql/fill_dm2_catalogs.sql)
- - - [fill_dm2_dep_data.sql](dags/sql/fill_dm2_dep_data.sql)
- - - [fill_dm2_departments_statistic.sql](dags/sql/fill_dm2_departments_statistic.sql)