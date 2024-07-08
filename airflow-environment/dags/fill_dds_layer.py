from airflow import DAG
import datetime
#from scripts.fill_data import get_fill_tables,get_truncate_table
from scripts.create_table import get_create_schema,get_create_tables

dag = DAG('create_and_fill_tables_dds', description='create_and_fill_tables_in_dds_layer', schedule_interval='@once', start_date=datetime.datetime(2024,7,2), catchup=False)

create_schema = get_create_schema(dag, 'dds_ksusha')
create_tables = get_create_tables(dag,'sql/create_tables_dds.sql')


create_schema >> create_tables