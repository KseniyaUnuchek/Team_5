from airflow.providers.common.sql.operators.sql import SQLExecuteQueryOperator
from airflow.providers.postgres.hooks.postgres import PostgresHook
from airflow.operators.python import PythonOperator


def get_fill_table_dds(dag, sql_script, task_id):
    return SQLExecuteQueryOperator(task_id=f"{task_id}",
                            sql=f"{sql_script}",
                            conn_id="etl_db_5",
                            dag=dag)

