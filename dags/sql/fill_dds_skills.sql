INSERT INTO dds_ksusha.skills (id, skill_name, group_id)
SELECT
    id,
    "название",
    1 AS group_id
FROM ods_ksusha."базы_данных";

INSERT INTO dds_ksusha.skills (id, skill_name, group_id)
SELECT
    id,
    "название",
    2 AS group_id
FROM ods_ksusha."инструменты";

INSERT INTO dds_ksusha.skills (id, skill_name, group_id)
SELECT
    id,
    "название",
    3 AS group_id
FROM ods_ksusha."платформы";

INSERT INTO dds_ksusha.skills (id, skill_name, group_id)
SELECT
    id,
    "название",
    4 AS group_id
FROM ods_ksusha."среды_разработки";

INSERT INTO dds_ksusha.skills (id, skill_name, group_id)
SELECT
    id,
    "название",
    5 AS group_id
FROM ods_ksusha."технологии";

UPDATE dds_ksusha.skills
SET skill_name = 'DWH_Tarantool'
WHERE id = 238998;

UPDATE dds_ksusha.skills
SET skill_name = 'DWH_Vertica'
WHERE id = 238999;

INSERT INTO dds_ksusha.skills (id, skill_name, group_id)
SELECT
    id,
    "название",
    6 AS group_id
FROM ods_ksusha."фреймворки";

INSERT INTO dds_ksusha.skills (id, skill_name, group_id)
SELECT
    id,
    "название",
    7 AS group_id
FROM ods_ksusha."языки_программирования";

UPDATE dds_ksusha.skills
SET skill_name = 'C#'
WHERE id = 115713;

INSERT INTO dds_ksusha.skills (id, skill_name, group_id)
SELECT
    id,
    "название",
    8 AS group_id
FROM ods_ksusha."отрасли";

INSERT INTO dds_ksusha.skills (id, skill_name, group_id)
SELECT
    id,
    "название",
    9 AS group_id
FROM ods_ksusha."предметная_область";

/* Заполнение слоя ошибок */
INSERT INTO bad_dds_ksusha.skills (id, skill_name, group_id)
SELECT
    id,
    "название",
    1 AS group_id
FROM ods_ksusha."базы_данных"
WHERE
    "название" IS NULL
    OR "название" = '-'
    OR "название" = ''
    OR "название" = '.'
    OR "название" = ' '
    OR id IS NULL
    OR id = 0;

INSERT INTO bad_dds_ksusha.skills (id, skill_name, group_id)
SELECT
    id,
    "название",
    2 AS group_id
FROM ods_ksusha."инструменты"
WHERE
    "название" IS NULL
    OR "название" = '-'
    OR "название" = ''
    OR "название" = '.'
    OR "название" = ' '
    OR id IS NULL
    OR id = 0;

INSERT INTO bad_dds_ksusha.skills (id, skill_name, group_id)
SELECT
    id,
    "название",
    3 AS group_id
FROM ods_ksusha."платформы"
WHERE
    "название" IS NULL
    OR "название" = '-'
    OR "название" = ''
    OR "название" = '.'
    OR "название" = ' '
    OR id IS NULL
    OR id = 0;

INSERT INTO bad_dds_ksusha.skills (id, skill_name, group_id)
SELECT
    id,
    "название",
    4 AS group_id
FROM ods_ksusha."среды_разработки"
WHERE
    "название" IS NULL
    OR "название" = '-'
    OR "название" = ''
    OR "название" = '.'
    OR "название" = ' '
    OR id IS NULL
    OR id = 0;

INSERT INTO bad_dds_ksusha.skills (id, skill_name, group_id)
SELECT
    id,
    "название",
    5 AS group_id
FROM ods_ksusha."технологии"
WHERE
    "название" IS NULL
    OR "название" = '-'
    OR "название" = ''
    OR "название" = '.'
    OR "название" = ' '
    OR id IS NULL
    OR id = 0;

INSERT INTO bad_dds_ksusha.skills (id, skill_name, group_id)
SELECT
    id,
    "название",
    6 AS group_id
FROM ods_ksusha."фреймворки"
WHERE
    "название" IS NULL
    OR "название" = '-'
    OR "название" = ''
    OR "название" = '.'
    OR "название" = ' '
    OR id IS NULL
    OR id = 0;

INSERT INTO bad_dds_ksusha.skills (id, skill_name, group_id)
SELECT
    id,
    "название",
    7 AS group_id
FROM ods_ksusha."языки_программирования"
WHERE
    "название" IS NULL
    OR "название" = '-'
    OR "название" = ''
    OR "название" = '.'
    OR "название" = ' '
    OR id IS NULL
    OR id = 0;

INSERT INTO bad_dds_ksusha.skills (id, skill_name, group_id)
SELECT
    id,
    "название",
    8 AS group_id
FROM ods_ksusha."отрасли"
WHERE
    "название" IS NULL
    OR "название" = '-'
    OR "название" = ''
    OR "название" = '.'
    OR "название" = ' '
    OR id IS NULL
    OR id = 0;

INSERT INTO bad_dds_ksusha.skills (id, skill_name, group_id)
SELECT
    id,
    "название",
    9 AS group_id
FROM ods_ksusha."предметная_область"
WHERE
    "название" IS NULL
    OR "название" = '-'
    OR "название" = ''
    OR "название" = '.'
    OR "название" = ' '
    OR id IS NULL
    OR id = 0;
