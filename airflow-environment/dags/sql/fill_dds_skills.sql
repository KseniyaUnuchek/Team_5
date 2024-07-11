INSERT INTO dds_ksusha.skills(id, skill_name, group_id)
SELECT id, название, 1 AS group_id
FROM ods_ksusha.базы_данных;

INSERT INTO dds_ksusha.skills(id, skill_name, group_id)
SELECT id, название, 2 AS group_id
FROM ods_ksusha.инструменты;

INSERT INTO dds_ksusha.skills(id, skill_name, group_id)
SELECT id, название, 3 AS group_id
FROM ods_ksusha.платформы;

INSERT INTO dds_ksusha.skills(id, skill_name, group_id)
SELECT id, название, 4 AS group_id
FROM ods_ksusha.среды_разработки;

INSERT INTO dds_ksusha.skills(id, skill_name, group_id)
SELECT id, название, 5 AS group_id
FROM ods_ksusha.технологии;

INSERT INTO dds_ksusha.skills(id, skill_name, group_id)
SELECT id, название, 6 AS group_id
FROM ods_ksusha.фреймворки;

INSERT INTO dds_ksusha.skills(id, skill_name, group_id)
SELECT id, название, 7 AS group_id
FROM ods_ksusha.языки_программирования;

INSERT INTO dds_ksusha.skills(id, skill_name, group_id)
SELECT id, название, 8 AS group_id
FROM ods_ksusha.отрасли;

INSERT INTO dds_ksusha.skills(id, skill_name, group_id)
SELECT id, название, 9 AS group_id
FROM ods_ksusha.предметная_область;