import datetime

from airflow import DAG

from scripts.create_table import get_create_schema, get_create_tables
from scripts.fill_data import get_truncate_table
from scripts.fill_tables import get_fill_table

with DAG(
    dag_id="create_and_fill_tables_dds",
    description="create_and_fill_tables_in_dds_layer",
    schedule_interval=None,
    start_date=datetime.datetime(2024, 7, 2, tzinfo=datetime.UTC),
    catchup=False,
) as dag:
    create_schema = get_create_schema(dag, "dds_ksusha", "create_schema")
    create_bad_schema = get_create_schema(dag, "bad_dds_ksusha", "create_bad_schema")
    create_tables = get_create_tables(dag, "sql/create_tables_dds.sql")
    truncate_tables = get_truncate_table(dag, "sql/truncate_tables_dds.sql")
    fill_all_catalogs = get_fill_table(dag, "sql/fill_dds_catalogs.sql", "fill_all_catalogs")
    fill_table_skills = get_fill_table(dag, "sql/fill_dds_skills.sql", "fill_table_skills")
    fill_table_levels = get_fill_table(dag, "sql/fill_dds_levels.sql", "fill_table_levels")
    fill_table_employees = get_fill_table(dag, "sql/fill_dds_employees.sql", "fill_table_employees")
    fill_table_cv_dar = get_fill_table(dag, "sql/fill_dds_cv_dar.sql", "fill_table_cv_dar")
    fill_table_skills_levels = get_fill_table(
        dag, "sql/fill_dds_skills_levels.sql", "fill_table_skills_levels")

    [create_schema, create_bad_schema] >> create_tables >> truncate_tables >> [fill_all_catalogs,
     fill_table_levels] >> fill_table_skills >> fill_table_employees >> fill_table_cv_dar >> \
    fill_table_skills_levels

