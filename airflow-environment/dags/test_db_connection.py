from airflow import DAG
import datetime
from airflow.providers.common.sql.operators.sql import SQLExecuteQueryOperator
from airflow.operators.empty import EmptyOperator

dag = DAG('test_connection_to_db', description='test', schedule_interval='@once', start_date=datetime.datetime(2024,7,2), catchup=False)

start_node = EmptyOperator(task_id="start_node", dag=dag)

get_data = SQLExecuteQueryOperator(task_id="get_data",
                            sql="SELECT * FROM source_data.инструменты",
                            conn_id="source_db",
                            dag=dag)

start_node >> get_data

