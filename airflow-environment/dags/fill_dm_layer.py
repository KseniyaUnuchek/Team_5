from airflow import DAG
import datetime
from scripts.fill_data import get_truncate_table
from scripts.create_table import get_create_schema, get_create_tables
from scripts.fill_tables import get_fill_table

with DAG(
    dag_id='create_and_fill_tables_dm',
    description='create_and_fill_tables_in_dm_layer',
    schedule_interval='@once', 
    start_date=datetime.datetime(2024,7,2), 
    catchup=False
) as dag:

    create_schema = get_create_schema(dag, 'dm_ksusha', 'create_schema')
    create_tables = get_create_tables(dag,'sql/create_tables_dm.sql')
    trancate = get_truncate_table(dag, 'sql/truncate_tables_dm.sql')
    fill_table_now = get_fill_table(dag, 'sql/fill_dm_now.sql', 'fill_table_now')
    fill_table_compare = get_fill_table(dag, 'sql/fill_dm_compare.sql', 'fill_table_compare')
    fill_table_total_change = get_fill_table(dag, 'sql/fill_dm_total_change.sql', 'fill_table_total_change')
    fill_table_complex_data = get_fill_table(dag, 'sql/fill_dm_complex_data.sql', 'fill_table_complex_data')
    fill_table_employees_statistic = get_fill_table(dag,'sql/fill_dm_employees_statistic.sql','fill_table_employees_statistic')
    copy_catalogs = get_fill_table(dag, 'sql/fill_dm_catalogs.sql', 'copy_catalogs')

    create_schema >> create_tables >> trancate >> fill_table_now >> fill_table_compare >> fill_table_total_change \
    >> fill_table_complex_data >> fill_table_employees_statistic >> copy_catalogs