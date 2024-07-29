import datetime

from airflow import DAG
from airflow.operators.trigger_dagrun import TriggerDagRunOperator

with DAG(
    dag_id="dag_orchestrator",
    description="start_every_dag_one_by_one",
    schedule_interval="@daily",
    start_date=datetime.datetime(2024, 7, 2, tzinfo=datetime.UTC),
    catchup=False,
) as dag:

    ods_layer = TriggerDagRunOperator(
        task_id="ods_layer",
        trigger_dag_id="create_and_fill_tables_ods",
        wait_for_completion=True,
        poke_interval=15,
    )
    dds_layer = TriggerDagRunOperator(
        task_id="dds_layer",
        trigger_dag_id="create_and_fill_tables_dds",
        wait_for_completion=True,
        poke_interval=5,
    )
    dm_layer = TriggerDagRunOperator(
        task_id="dm_layer",
        trigger_dag_id="create_and_fill_tables_dm",
        wait_for_completion=True,
        poke_interval=5,
    )
    dm2_layer = TriggerDagRunOperator(
        task_id="dm2_layer",
        trigger_dag_id="create_and_fill_tables_dm2",
        wait_for_completion=True,
        poke_interval=5,
    )

    ods_layer >> dds_layer >> dm_layer >> dm2_layer
