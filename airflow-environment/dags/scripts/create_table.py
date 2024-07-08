from airflow.providers.common.sql.operators.sql import SQLExecuteQueryOperator

def get_create_schema(dag):
    return SQLExecuteQueryOperator(task_id="create_schema",
                            sql="CREATE SCHEMA IF NOT EXISTS ods_ksusha",
                            conn_id="etl_db_5",
                            dag=dag)

def get_create_tables(dag):
    return SQLExecuteQueryOperator(task_id="create_tables",
                            sql="sql/create_tables.sql",
                            conn_id="etl_db_5",
                            dag=dag)
