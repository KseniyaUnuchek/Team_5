from airflow.providers.common.sql.operators.sql import SQLExecuteQueryOperator


def get_fill_table(dag, sql_script, task_id):
    return SQLExecuteQueryOperator(task_id=f"{task_id}",
                            sql=f"{sql_script}",
                            conn_id="etl_db_5",
                            dag=dag)

