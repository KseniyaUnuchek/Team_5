INSERT INTO dds_ksusha.skills(skill_name, external_id, group_id)
SELECT название, id, 1 as group_id
FROM ods_ksusha.фреймворки;

INSERT INTO dds_ksusha.skills(skill_name, external_id, group_id)
SELECT название, id, 2 as group_id
FROM ods_ksusha.технологии;

INSERT INTO dds_ksusha.skills(skill_name, external_id, group_id)
SELECT название, id, 3 as group_id
FROM ods_ksusha.языки_программирования;
      
INSERT INTO dds_ksusha.skills(skill_name, external_id, group_id)
SELECT название, id, 4 as group_id
FROM ods_ksusha.среды_разработки;

INSERT INTO dds_ksusha.skills(skill_name, external_id, group_id)
SELECT название, id, 5 as group_id
FROM ods_ksusha.инструменты;

INSERT INTO dds_ksusha.skills(skill_name, external_id, group_id)
SELECT название, id, 6 as group_id
FROM ods_ksusha.базы_данных;