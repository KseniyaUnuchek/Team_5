from airflow.providers.common.sql.operators.sql import SQLExecuteQueryOperator


def get_create_schema(dag, schema_name, task_id):
    return SQLExecuteQueryOperator(task_id=f"{task_id}",
                                sql=f"CREATE SCHEMA IF NOT EXISTS {schema_name}",
                                conn_id="etl_db_5",
                                dag=dag)


def get_create_tables(dag, sql_script):
    return SQLExecuteQueryOperator(task_id="create_tables",
                                sql=f"{sql_script}",
                                conn_id="etl_db_5",
                                dag=dag)

