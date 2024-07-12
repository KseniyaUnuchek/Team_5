from airflow import DAG
import datetime
from scripts.fill_data import get_fill_tables,get_truncate_table
from scripts.create_table import get_create_schema,get_create_tables

with DAG(
    dag_id='create_and_fill_tables_ods',
    description='create_tables_in_ods_layer',
    schedule_interval='@once', 
    start_date=datetime.datetime(2024,7,2), 
    catchup=False
) as dag:

    create_schema = get_create_schema(dag, 'ods_ksusha', 'create_schema')
    create_tables = get_create_tables(dag,'sql/create_tables_ods.sql')
    trancate = get_truncate_table(dag, 'sql/truncate_tables.sql')
    fill = get_fill_tables(dag)

    create_schema >> create_tables >> trancate >> fill