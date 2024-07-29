import datetime

from airflow import DAG

from scripts.create_table import get_create_schema, get_create_tables
from scripts.fill_data import get_truncate_table
from scripts.fill_tables import get_fill_table

with DAG(
        dag_id="create_and_fill_tables_dm2",
        description="create_and_fill_tables_in_dm2_layer",
        schedule_interval="@once",
        start_date=datetime.datetime(2024, 7, 2, tzinfo=datetime.UTC),
        catchup=False
) as dag:
    create_schema = get_create_schema(dag, "dm2_ksusha", "create_schema")
    create_tables = get_create_tables(dag, "sql/create_tables_dm2.sql")
    truncate_tables = get_truncate_table(dag, "sql/truncate_tables_dm2.sql")
    copy_catalogs = get_fill_table(dag, "sql/fill_dm2_catalogs.sql", "copy_catalogs")
    fill_table_dep_data = get_fill_table(dag, "sql/fill_dm2_dep_data.sql", "fill_table_dep_data")
    fill_table_departments_statistic = get_fill_table(dag, "sql/fill_dm2_departments_statistic.sql",
                                                      "fill_table_department_statistic")

    create_schema >> create_tables >> truncate_tables >> copy_catalogs >> fill_table_dep_data >> \
    fill_table_departments_statistic
