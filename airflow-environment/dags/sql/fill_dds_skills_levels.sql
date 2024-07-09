INSERT INTO dds_ksusha.skills_levels(id, employee_id, skill_id, level_id, date)
WITH src AS (
    SELECT *
    FROM (SELECT split_part("название", ':', 2)::INTEGER AS employee_id,
        substring("Базы данных" FROM '\[([0-9]+)\]')::INTEGER AS skill_id,
        split_part("Уровень знаний", ' [', 1) AS level,
        "Дата изм." as date, 
        id
        FROM ods_ksusha.базы_данных_и_уровень_знаний_сотру) AS tt
    WHERE employee_id IS NOT NULL 
    AND level IS NOT NULL 
    AND skill_id IS NOT NULL
)
SELECT src.id, e.id, s.id, l.id, src.date::DATE  
FROM src
JOIN dds_ksusha.levels AS l
ON src.level = l.level
JOIN dds_ksusha.skills AS s
ON src.skill_id = s.external_id
JOIN dds_ksusha.employees AS e
ON src.employee_id = e.id;


INSERT INTO dds_ksusha.skills_levels(id, employee_id, skill_id, level_id, date)
WITH src AS (
    SELECT *
    FROM (SELECT split_part("название", ':', 2)::INTEGER AS employee_id,
        substring(фреймворки FROM '\[([0-9]+)\]')::INTEGER AS skill_id,
        split_part("Уровень знаний", ' [', 1) AS level,
        "Дата изм." as date, 
        id
        FROM ods_ksusha.фреймворки_и_уровень_знаний_сотру) AS tt
    WHERE employee_id IS NOT NULL 
    AND level IS NOT NULL 
    AND skill_id IS NOT NULL
)
SELECT src.id, e.id, s.id, l.id, src.date::DATE  
FROM src
JOIN dds_ksusha.levels AS l
ON src.level = l.level
JOIN dds_ksusha.skills AS s
ON src.skill_id = s.external_id
JOIN dds_ksusha.employees AS e
ON src.employee_id = e.id;


INSERT INTO dds_ksusha.skills_levels(id, employee_id, skill_id, level_id, date)
WITH src AS (
    SELECT *
    FROM (SELECT split_part("название", ':', 2)::INTEGER AS employee_id,
        substring(технологии FROM '\[([0-9]+)\]')::INTEGER AS skill_id,
        split_part("Уровень знаний", ' [', 1) AS level,
        "Дата изм." as date, 
        id
        FROM ods_ksusha.технологии_и_уровень_знаний_сотру) AS tt
    WHERE employee_id IS NOT NULL 
    AND level IS NOT NULL 
    AND skill_id IS NOT NULL
)
SELECT src.id, e.id, s.id, l.id, src.date::DATE  
FROM src
JOIN dds_ksusha.levels AS l
ON src.level = l.level
JOIN dds_ksusha.skills AS s
ON src.skill_id = s.external_id
JOIN dds_ksusha.employees AS e
ON src.employee_id = e.id;


INSERT INTO dds_ksusha.skills_levels(id, employee_id, skill_id, level_id, date)
WITH src AS (
    SELECT *
    FROM (SELECT split_part(название, ':', 2)::INTEGER AS employee_id,
        substring("Языки программирования" FROM '\[([0-9]+)\]')::INTEGER AS skill_id,
        split_part("Уровень знаний", ' [', 1) AS level,
        "Дата изм." as date, 
        id
        FROM ods_ksusha.языки_программирования_и_уровень) AS tt
    WHERE employee_id IS NOT NULL 
    AND level IS NOT NULL 
    AND skill_id IS NOT NULL
)
SELECT src.id, e.id, s.id, l.id, src.date::DATE  
FROM src
JOIN dds_ksusha.levels AS l
ON src.level = l.level
JOIN dds_ksusha.skills AS s
ON src.skill_id = s.external_id
JOIN dds_ksusha.employees AS e
ON src.employee_id = e.id;


INSERT INTO dds_ksusha.skills_levels(id, employee_id, skill_id, level_id, date)
WITH src AS (
    SELECT *
    FROM (SELECT split_part(название, ':', 2)::INTEGER AS employee_id,
        substring("Среды разработки" FROM '\[([0-9]+)\]')::INTEGER AS skill_id,
        split_part("Уровень знаний", ' [', 1) AS level,
        "Дата изм." as date, 
        id
        FROM ods_ksusha.среды_разработки_и_уровень_знаний_) AS tt
    WHERE employee_id IS NOT NULL 
    AND level IS NOT NULL 
    AND skill_id IS NOT NULL
)
SELECT src.id, e.id, s.id, l.id, src.date::DATE  
FROM src
JOIN dds_ksusha.levels AS l
ON src.level = l.level
JOIN dds_ksusha.skills AS s
ON src.skill_id = s.external_id
JOIN dds_ksusha.employees AS e
ON src.employee_id = e.id;


INSERT INTO dds_ksusha.skills_levels(id, employee_id, skill_id, level_id, date)
WITH src AS (
    SELECT *
    FROM (SELECT split_part(название, ':', 2)::INTEGER AS employee_id,
        substring(инструменты FROM '\[([0-9]+)\]')::INTEGER AS skill_id,
        split_part("Уровень знаний", ' [', 1) AS level,
        "Дата изм." as date, 
        id
        FROM ods_ksusha.инструменты_и_уровень_знаний_сотр) AS tt
    WHERE employee_id IS NOT NULL 
    AND level IS NOT NULL 
    AND skill_id IS NOT NULL
)
SELECT src.id, e.id, s.id, l.id, src.date::DATE  
FROM src
JOIN dds_ksusha.levels AS l
ON src.level = l.level
JOIN dds_ksusha.skills AS s
ON src.skill_id = s.external_id
JOIN dds_ksusha.employees AS e
ON src.employee_id = e.id;
