from airflow.providers.common.sql.operators.sql import SQLExecuteQueryOperator
from airflow.providers.postgres.hooks.postgres import PostgresHook
from airflow.operators.python import PythonOperator

src = PostgresHook(postgres_conn_id='source_db')
target = PostgresHook(postgres_conn_id='etl_db_5')
src_conn = src.get_conn()
trg_conn = target.get_conn()
src_cursor = src.get_cursor()
 
def insert (**kwargs):
    list_table_names = ['базы_данных', 'базы_данных_и_уровень_знаний_сотру', 'инструменты', 'инструменты_и_уровень_знаний_сотр', 
                        'образование_пользователей', 'опыт_сотрудника_в_отраслях', 'опыт_сотрудника_в_предметных_обла', 'отрасли',
                        'платформы', 'платформы_и_уровень_знаний_сотруд', 'предметная_область', 'резюмедар', 'сертификаты_пользователей',
                        'сотрудники_дар', 'среды_разработки', 'среды_разработки_и_уровень_знаний_', 'технологии', 
                        'технологии_и_уровень_знаний_сотру', 'типы_систем', 'типы_систем_и_уровень_знаний_сотру',
                        'уровень_образования', 'уровни_владения_ин', 'уровни_знаний', 'уровни_знаний_в_отрасли', 
                        'уровни_знаний_в_предметной_област', 'фреймворки', 'фреймворки_и_уровень_знаний_сотру', 
                        'языки', 'языки_пользователей', 'языки_программирования', 'языки_программирования_и_уровень']
    for table_name in list_table_names:
        src_cursor.execute(f"SELECT * FROM source_data.{table_name};")
        target.insert_rows(table=f"ods_ksusha.{table_name}", rows=src_cursor)


def get_truncate_table(dag, sql_script):
    return SQLExecuteQueryOperator(task_id="truncate_tables",
                            sql=f"{sql_script}",
                            conn_id="etl_db_5",
                            dag=dag)


def get_fill_tables(dag):
    return PythonOperator(task_id="fill_tables",
                            python_callable = insert,
                            dag=dag) 