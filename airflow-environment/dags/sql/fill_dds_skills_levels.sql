INSERT INTO dds_ksusha.skills_levels(id, empl_id, skill_id, level_id, date)
WITH src AS (
    SELECT *
    FROM (SELECT split_part("название", ':', 2)::INTEGER AS empl_id,
        substring("Базы данных" FROM '\[([0-9]+)\]')::INTEGER AS skill_id,
        substring("Уровень знаний" FROM '\[([0-9]+)\]')::INTEGER AS level_id,
        дата as date, 
        id
        FROM ods_ksusha.базы_данных_и_уровень_знаний_сотру
        WHERE дата != ''
        AND дата != '-'
        AND дата IS NOT NULL) AS tt
    WHERE empl_id IS NOT NULL 
    AND level_id IS NOT NULL 
    AND skill_id IS NOT NULL
)
SELECT src.id, 
    e.id, 
    s.id,
    l.id, 
    src.date::DATE  
FROM src
JOIN dds_ksusha.levels AS l
ON src.level_id = l.id
JOIN dds_ksusha.skills AS s
ON src.skill_id = s.id
JOIN dds_ksusha.employees AS e
ON src.empl_id = e.id;

INSERT INTO dds_ksusha.skills_levels(id, empl_id, skill_id, level_id, date)
WITH src AS (
    SELECT *
    FROM (SELECT split_part(название, ':', 2)::INTEGER AS empl_id,
        substring(инструменты FROM '\[([0-9]+)\]')::INTEGER AS skill_id,
        substring("Уровень знаний" FROM '\[([0-9]+)\]')::INTEGER AS level_id,
        дата as date, 
        id
        FROM ods_ksusha.инструменты_и_уровень_знаний_сотр
        WHERE дата != ''
        AND дата != '-'
        AND дата IS NOT NULL) AS tt
    WHERE empl_id IS NOT NULL 
    AND level_id IS NOT NULL 
    AND skill_id IS NOT NULL
)
SELECT src.id, 
    e.id, 
    s.id,
    l.id, 
    src.date::DATE  
FROM src
JOIN dds_ksusha.levels AS l
ON src.level_id = l.id
JOIN dds_ksusha.skills AS s
ON src.skill_id = s.id
JOIN dds_ksusha.employees AS e
ON src.empl_id = e.id;

INSERT INTO dds_ksusha.skills_levels(id, empl_id, skill_id, level_id, date)
WITH src AS (
    SELECT *
    FROM (SELECT "User ID"::INTEGER AS empl_id,
        substring(платформы FROM '\[([0-9]+)\]')::INTEGER AS skill_id,
        substring("Уровень знаний" FROM '\[([0-9]+)\]')::INTEGER AS level_id,
        дата as date, 
        id
        FROM ods_ksusha.платформы_и_уровень_знаний_сотруд
        WHERE дата != ''
        AND дата != '-'
        AND дата IS NOT NULL) AS tt
    WHERE empl_id IS NOT NULL 
    AND level_id IS NOT NULL 
    AND skill_id IS NOT NULL
)
SELECT src.id, 
    e.id, 
    s.id,
    l.id, 
    src.date::DATE  
FROM src
JOIN dds_ksusha.levels AS l
ON src.level_id = l.id
JOIN dds_ksusha.skills AS s
ON src.skill_id = s.id
JOIN dds_ksusha.employees AS e
ON src.empl_id = e.id;

INSERT INTO dds_ksusha.skills_levels(id, empl_id, skill_id, level_id, date)
WITH src AS (
    SELECT *
    FROM (SELECT split_part(название, ':', 2)::INTEGER AS empl_id,
        substring("Среды разработки" FROM '\[([0-9]+)\]')::INTEGER AS skill_id,
        substring("Уровень знаний" FROM '\[([0-9]+)\]')::INTEGER AS level_id,
        дата as date, 
        id
        FROM ods_ksusha.среды_разработки_и_уровень_знаний_
        WHERE дата != ''
        AND дата != '-'
        AND дата IS NOT NULL) AS tt
    WHERE empl_id IS NOT NULL 
    AND level_id IS NOT NULL 
    AND skill_id IS NOT NULL
)
SELECT src.id, 
    e.id, 
    s.id,
    l.id, 
    src.date::DATE  
FROM src
JOIN dds_ksusha.levels AS l
ON src.level_id = l.id
JOIN dds_ksusha.skills AS s
ON src.skill_id = s.id
JOIN dds_ksusha.employees AS e
ON src.empl_id = e.id;

INSERT INTO dds_ksusha.skills_levels(id, empl_id, skill_id, level_id, date)
WITH src AS (
    SELECT *
    FROM (SELECT split_part(название, ':', 2)::INTEGER AS empl_id,
        substring(технологии FROM '\[([0-9]+)\]')::INTEGER AS skill_id,
        substring("Уровень знаний" FROM '\[([0-9]+)\]')::INTEGER AS level_id,
        дата as date, 
        id
        FROM ods_ksusha.технологии_и_уровень_знаний_сотру
        WHERE дата != ''
        AND дата != '-'
        AND дата IS NOT NULL) AS tt
    WHERE empl_id IS NOT NULL 
    AND level_id IS NOT NULL 
    AND skill_id IS NOT NULL
)
SELECT src.id, 
    e.id, 
    s.id,
    l.id, 
    src.date::DATE  
FROM src
JOIN dds_ksusha.levels AS l
ON src.level_id = l.id
JOIN dds_ksusha.skills AS s
ON src.skill_id = s.id
JOIN dds_ksusha.employees AS e
ON src.empl_id = e.id;

INSERT INTO dds_ksusha.skills_levels(id, empl_id, skill_id, level_id, date)
WITH src AS (
    SELECT *
    FROM (SELECT split_part(название, ':', 2)::INTEGER AS empl_id,
        substring(фреймворки FROM '\[([0-9]+)\]')::INTEGER AS skill_id,
        substring("Уровень знаний" FROM '\[([0-9]+)\]')::INTEGER AS level_id,
        дата as date, 
        id
        FROM ods_ksusha.фреймворки_и_уровень_знаний_сотру
        WHERE дата != ''
        AND дата != '-'
        AND дата IS NOT NULL) AS tt
    WHERE empl_id IS NOT NULL 
    AND level_id IS NOT NULL 
    AND skill_id IS NOT NULL
)
SELECT src.id, 
    e.id, 
    s.id,
    l.id, 
    src.date::DATE  
FROM src
JOIN dds_ksusha.levels AS l
ON src.level_id = l.id
JOIN dds_ksusha.skills AS s
ON src.skill_id = s.id
JOIN dds_ksusha.employees AS e
ON src.empl_id = e.id;

INSERT INTO dds_ksusha.skills_levels(id, empl_id, skill_id, level_id, date)
WITH src AS (
    SELECT *
    FROM (SELECT split_part(название, ':', 2)::INTEGER AS empl_id,
        substring("Языки программирования" FROM '\[([0-9]+)\]')::INTEGER AS skill_id,
        substring("Уровень знаний" FROM '\[([0-9]+)\]')::INTEGER AS level_id,
        дата as date, 
        id
        FROM ods_ksusha.языки_программирования_и_уровень
        WHERE дата != ''
        AND дата != '-'
        AND дата IS NOT NULL) AS tt
    WHERE empl_id IS NOT NULL 
    AND level_id IS NOT NULL 
    AND skill_id IS NOT NULL
)
SELECT src.id, 
    e.id, 
    s.id,
    l.id, 
    src.date::DATE  
FROM src
JOIN dds_ksusha.levels AS l
ON src.level_id = l.id
JOIN dds_ksusha.skills AS s
ON src.skill_id = s.id
JOIN dds_ksusha.employees AS e
ON src.empl_id = e.id;

INSERT INTO dds_ksusha.skills_levels(id, empl_id, skill_id, level_id, date)
WITH src AS (
    SELECT *
    FROM (SELECT "User ID"::INTEGER AS empl_id,
        substring(отрасли FROM '\[([0-9]+)\]')::INTEGER AS skill_id,
        substring("Уровень знаний в отрасли" FROM '\[([0-9]+)\]')::INTEGER AS level_id,
        дата as date, 
        id
        FROM ods_ksusha.опыт_сотрудника_в_отраслях
        WHERE дата != ''
        AND дата != '-'
        AND дата IS NOT NULL) AS tt
    WHERE empl_id IS NOT NULL 
    AND skill_id IS NOT NULL 
    AND level_id IS NOT NULL
)
SELECT src.id, 
    e.id, 
    s.id,
    l.id, 
    src.date::DATE
FROM src
JOIN dds_ksusha.levels AS l
ON src.level_id = l.id
JOIN dds_ksusha.skills AS s
ON src.skill_id = s.id
JOIN dds_ksusha.employees AS e
ON src.empl_id = e.id;

INSERT INTO dds_ksusha.skills_levels(id, empl_id, skill_id, level_id, date)
WITH src AS (
    SELECT *
    FROM (SELECT "User ID"::INTEGER AS empl_id,
        substring("Предментые области" FROM '\[([0-9]+)\]')::INTEGER AS skill_id,
        substring("Уровень знаний в предметной облас" FROM '\[([0-9]+)\]')::INTEGER AS level_id,
        дата as date, 
        id
        FROM ods_ksusha.опыт_сотрудника_в_предметных_обла
        WHERE дата != ''
        AND дата != '-'
        AND дата IS NOT NULL)AS tt
    WHERE empl_id IS NOT NULL 
    AND skill_id IS NOT NULL 
    AND level_id IS NOT NULL
)
SELECT src.id, 
    e.id, 
    s.id,
    l.id, 
    src.date::DATE
FROM src
JOIN dds_ksusha.levels AS l
ON src.level_id = l.id
JOIN dds_ksusha.skills AS s
ON src.skill_id = s.id
JOIN dds_ksusha.employees AS e
ON src.empl_id = e.id;