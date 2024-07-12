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
        AND дата != ' '
        AND дата IS NOT NULL
        AND дата::DATE < current_date) AS tt
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
        AND дата != ' '
        AND дата IS NOT NULL
        AND дата::DATE < current_date) AS tt
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
        AND дата != ' '
        AND дата IS NOT NULL
        AND дата::DATE < current_date) AS tt
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
        AND дата != ' '
        AND дата IS NOT NULL
        AND дата::DATE < current_date) AS tt
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
        AND дата != ' '
        AND дата IS NOT NULL
        AND дата::DATE < current_date) AS tt
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
        AND дата != ' '
        AND дата IS NOT NULL
        AND дата::DATE < current_date) AS tt
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
        AND дата != ' '
        AND дата IS NOT NULL
        AND дата::DATE < current_date) AS tt
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
        AND дата != ' '
        AND дата IS NOT NULL
        AND дата::DATE < current_date) AS tt
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
        AND дата != ' '
        AND дата IS NOT NULL
        AND дата::DATE < current_date)AS tt
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

/* Заполнение слоя с ошибками */
INSERT INTO bad_dds_ksusha.skills_levels(id, empl_id, skill_id, level_id, date)
WITH src AS (
    SELECT *
    FROM (SELECT split_part("название", ':', 2) AS empl_id,
        substring("Базы данных" FROM '\[([0-9]+)\]') AS skill_id,
        substring("Уровень знаний" FROM '\[([0-9]+)\]') AS level_id,
        дата as date, 
        id
        FROM ods_ksusha.базы_данных_и_уровень_знаний_сотру
        WHERE "название" IS NULL
        OR "Базы данных" IS NULL
        OR "Уровень знаний" IS NULL
        OR дата IS NULL
        OR id IS NULL
        OR "название" = ''
        OR "название" = '-'
        OR "название" = ' '
        OR "Базы данных" = ''
        OR "Базы данных" = '-'
        OR "Базы данных" = ' '
        OR "Уровень знаний" = ''
        OR "Уровень знаний" = '-'
        OR "Уровень знаний" = ' '
        OR дата = '' 
        OR дата = '-' 
        OR дата = ' ' 
        OR дата::DATE > current_date
        OR id = 0) AS tt
)
SELECT src.id, 
    e.id, 
    s.id,
    l.id, 
    src.date
FROM src
LEFT JOIN dds_ksusha.levels AS l
ON src.level_id = l.id::TEXT
LEFT JOIN dds_ksusha.skills AS s
ON src.skill_id = s.id::TEXT
LEFT JOIN dds_ksusha.employees AS e
ON src.empl_id = e.id::TEXT;

INSERT INTO bad_dds_ksusha.skills_levels(id, empl_id, skill_id, level_id, date)
WITH src AS (
    SELECT *
    FROM (SELECT split_part(название, ':', 2) AS empl_id,
        substring(инструменты FROM '\[([0-9]+)\]') AS skill_id,
        substring("Уровень знаний" FROM '\[([0-9]+)\]') AS level_id,
        дата as date, 
        id
        FROM ods_ksusha.инструменты_и_уровень_знаний_сотр
        WHERE название IS NULL
        OR инструменты IS NULL
        OR "Уровень знаний" IS NULL
        OR дата IS NULL
        OR id IS NULL
        OR название = ''
        OR название = '-'
        OR название = ' '
        OR инструменты = ''
        OR инструменты = '-'
        OR инструменты = ' '
        OR "Уровень знаний" = ''
        OR "Уровень знаний" = '-'
        OR "Уровень знаний" = ' '
        OR дата = '' 
        OR дата = '-' 
        OR дата = ' '
        OR дата::DATE > current_date
        OR id = 0) AS tt
)
SELECT src.id, 
    e.id, 
    s.id,
    l.id, 
    src.date 
FROM src
LEFT JOIN dds_ksusha.levels AS l
ON src.level_id = l.id::TEXT
LEFT JOIN dds_ksusha.skills AS s
ON src.skill_id = s.id::TEXT
LEFT JOIN dds_ksusha.employees AS e
ON src.empl_id = e.id::TEXT;

INSERT INTO bad_dds_ksusha.skills_levels(id, empl_id, skill_id, level_id, date)
WITH src AS (
    SELECT *
    FROM (SELECT "User ID" AS empl_id,
        substring(платформы FROM '\[([0-9]+)\]') AS skill_id,
        substring("Уровень знаний" FROM '\[([0-9]+)\]') AS level_id,
        дата as date, 
        id
        FROM ods_ksusha.платформы_и_уровень_знаний_сотруд
        WHERE "User ID" IS NULL
        OR платформы IS NULL
        OR "Уровень знаний" IS NULL
        OR дата IS NULL
        OR id IS NULL
        OR "User ID" = 0
        OR платформы = ''
        OR платформы = '-'
        OR платформы = ' '
        OR "Уровень знаний" = ''
        OR "Уровень знаний" = '-'
        OR "Уровень знаний" = ' '
        OR дата = '' 
        OR дата = '-' 
        OR дата = ' '
        OR дата::DATE > current_date
        OR id = 0) AS tt
)
SELECT src.id, 
    e.id, 
    s.id,
    l.id, 
    src.date
FROM src
LEFT JOIN dds_ksusha.levels AS l
ON src.level_id = l.id::TEXT
LEFT JOIN dds_ksusha.skills AS s
ON src.skill_id = s.id::TEXT
LEFT JOIN dds_ksusha.employees AS e
ON src.empl_id::TEXT = e.id::TEXT;

INSERT INTO bad_dds_ksusha.skills_levels(id, empl_id, skill_id, level_id, date)
WITH src AS (
    SELECT *
    FROM (SELECT split_part(название, ':', 2) AS empl_id,
        substring("Среды разработки" FROM '\[([0-9]+)\]') AS skill_id,
        substring("Уровень знаний" FROM '\[([0-9]+)\]') AS level_id,
        дата as date, 
        id
        FROM ods_ksusha.среды_разработки_и_уровень_знаний_
        WHERE название IS NULL
        OR "Среды разработки" IS NULL
        OR "Уровень знаний" IS NULL
        OR дата IS NULL
        OR id IS NULL
        OR название = ''
        OR название = '-'
        OR название = ' '
        OR "Среды разработки" = ''
        OR "Среды разработки" = '-'
        OR "Среды разработки" = ' '
        OR "Уровень знаний" = ''
        OR "Уровень знаний" = '-'
        OR "Уровень знаний" = ' '
        OR дата = '' 
        OR дата = '-' 
        OR дата = ' '
        OR дата::DATE > current_date
        OR id = 0) AS tt
)
SELECT src.id, 
    e.id, 
    s.id,
    l.id, 
    src.date
FROM src
LEFT JOIN dds_ksusha.levels AS l
ON src.level_id = l.id::TEXT
LEFT JOIN dds_ksusha.skills AS s
ON src.skill_id = s.id::TEXT
LEFT JOIN dds_ksusha.employees AS e
ON src.empl_id = e.id::TEXT;

INSERT INTO bad_dds_ksusha.skills_levels(id, empl_id, skill_id, level_id, date)
WITH src AS (
    SELECT *
    FROM (SELECT split_part(название, ':', 2) AS empl_id,
        substring(технологии FROM '\[([0-9]+)\]') AS skill_id,
        substring("Уровень знаний" FROM '\[([0-9]+)\]') AS level_id,
        дата as date, 
        id
        FROM ods_ksusha.технологии_и_уровень_знаний_сотру
        WHERE название IS NULL
        OR технологии IS NULL
        OR "Уровень знаний" IS NULL
        OR дата IS NULL
        OR id IS NULL
        OR название = ''
        OR название = '-'
        OR название = ' '
        OR технологии = ''
        OR технологии = '-'
        OR технологии = ' '
        OR "Уровень знаний" = ''
        OR "Уровень знаний" = '-'
        OR "Уровень знаний" = ' '
        OR дата = '' 
        OR дата = '-'
        OR дата = ' ' 
        OR дата::DATE > current_date
        OR id = 0) AS tt
)
SELECT src.id, 
    e.id, 
    s.id,
    l.id, 
    src.date
FROM src
LEFT JOIN dds_ksusha.levels AS l
ON src.level_id = l.id::TEXT
LEFT JOIN dds_ksusha.skills AS s
ON src.skill_id = s.id::TEXT
LEFT JOIN dds_ksusha.employees AS e
ON src.empl_id = e.id::TEXT;

INSERT INTO bad_dds_ksusha.skills_levels(id, empl_id, skill_id, level_id, date)
WITH src AS (
    SELECT *
    FROM (SELECT split_part(название, ':', 2) AS empl_id,
        substring(фреймворки FROM '\[([0-9]+)\]') AS skill_id,
        substring("Уровень знаний" FROM '\[([0-9]+)\]') AS level_id,
        дата as date, 
        id
        FROM ods_ksusha.фреймворки_и_уровень_знаний_сотру
        WHERE название IS NULL
        OR фреймворки IS NULL
        OR "Уровень знаний" IS NULL
        OR дата IS NULL
        OR id IS NULL
        OR название = ''
        OR название = '-'
        OR название = ' '
        OR фреймворки = ''
        OR фреймворки = '-'
        OR фреймворки = ' '
        OR "Уровень знаний" = ''
        OR "Уровень знаний" = '-'
        OR "Уровень знаний" = ' '
        OR дата = '' 
        OR дата = '-' 
        OR дата = ' '
        OR дата::DATE > current_date
        OR id = 0) AS tt
)
SELECT src.id, 
    e.id, 
    s.id,
    l.id, 
    src.date  
FROM src
LEFT JOIN dds_ksusha.levels AS l
ON src.level_id = l.id::TEXT
LEFT JOIN dds_ksusha.skills AS s
ON src.skill_id = s.id::TEXT
LEFT JOIN dds_ksusha.employees AS e
ON src.empl_id = e.id::TEXT;

INSERT INTO bad_dds_ksusha.skills_levels(id, empl_id, skill_id, level_id, date)
WITH src AS (
    SELECT *
    FROM (SELECT split_part(название, ':', 2) AS empl_id,
        substring("Языки программирования" FROM '\[([0-9]+)\]') AS skill_id,
        substring("Уровень знаний" FROM '\[([0-9]+)\]')  AS level_id,
        дата as date, 
        id
        FROM ods_ksusha.языки_программирования_и_уровень
        WHERE название IS NULL
        OR "Языки программирования" IS NULL
        OR "Уровень знаний" IS NULL
        OR дата IS NULL
        OR id IS NULL
        OR название = ''
        OR название = '-'
        OR название = ' '
        OR "Языки программирования" = ''
        OR "Языки программирования"= '-'
        OR "Языки программирования" = ' '
        OR "Уровень знаний" = ''
        OR "Уровень знаний" = '-'
        OR "Уровень знаний" = ' '
        OR дата = '' 
        OR дата = '-' 
        OR дата = ' '
        OR дата::DATE > current_date
        OR id = 0) AS tt
)
SELECT src.id, 
    e.id, 
    s.id,
    l.id, 
    src.date
FROM src
LEFT JOIN dds_ksusha.levels AS l
ON src.level_id = l.id::TEXT
LEFT JOIN dds_ksusha.skills AS s
ON src.skill_id = s.id::TEXT
LEFT JOIN dds_ksusha.employees AS e
ON src.empl_id = e.id::TEXT;

INSERT INTO bad_dds_ksusha.skills_levels(id, empl_id, skill_id, level_id, date)
WITH src AS (
    SELECT *
    FROM (SELECT "User ID" AS empl_id,
        substring(отрасли FROM '\[([0-9]+)\]') AS skill_id,
        substring("Уровень знаний в отрасли" FROM '\[([0-9]+)\]') AS level_id,
        дата as date, 
        id
        FROM ods_ksusha.опыт_сотрудника_в_отраслях
        WHERE "User ID" IS NULL
        OR отрасли IS NULL
        OR "Уровень знаний в отрасли" IS NULL
        OR дата IS NULL
        OR id IS NULL
        OR "User ID" = 0
        OR отрасли = ''
        OR отрасли = '-'
        OR отрасли = ' '
        OR "Уровень знаний в отрасли" = ''
        OR "Уровень знаний в отрасли" = '-'
        OR "Уровень знаний в отрасли" = ' '
        OR дата = '' 
        OR дата = '-' 
        OR дата = ' '
        OR дата::DATE > current_date
        OR id = 0) AS tt
)
SELECT src.id, 
    e.id, 
    s.id,
    l.id, 
    src.date
FROM src
LEFT JOIN dds_ksusha.levels AS l
ON src.level_id = l.id::TEXT
LEFT JOIN dds_ksusha.skills AS s
ON src.skill_id = s.id::TEXT
LEFT JOIN dds_ksusha.employees AS e
ON src.empl_id::TEXT = e.id::TEXT;

INSERT INTO bad_dds_ksusha.skills_levels(id, empl_id, skill_id, level_id, date)
WITH src AS (
    SELECT *
    FROM (SELECT "User ID" AS empl_id,
        substring("Предментые области" FROM '\[([0-9]+)\]') AS skill_id,
        substring("Уровень знаний в предметной облас" FROM '\[([0-9]+)\]') AS level_id,
        дата as date, 
        id
        FROM ods_ksusha.опыт_сотрудника_в_предметных_обла
        WHERE "User ID" IS NULL
        OR "Предментые области" IS NULL
        OR "Уровень знаний в предметной облас" IS NULL
        OR дата IS NULL
        OR id IS NULL
        OR "User ID" = 0
        OR "Предментые области" = ''
        OR "Предментые области" = '-'
        OR "Предментые области" = ' '
        OR "Уровень знаний в предметной облас" = ''
        OR "Уровень знаний в предметной облас" = '-'
        OR "Уровень знаний в предметной облас" = ' '
        OR дата = '' 
        OR дата = '-' 
        OR дата = ' '
        OR дата::DATE > current_date
        OR id = 0)AS tt
)
SELECT src.id, 
    e.id, 
    s.id,
    l.id, 
    src.date
FROM src
LEFT JOIN dds_ksusha.levels AS l
ON src.level_id = l.id::TEXT
LEFT JOIN dds_ksusha.skills AS s
ON src.skill_id = s.id::TEXT
LEFT JOIN dds_ksusha.employees AS e
ON src.empl_id::TEXT = e.id::TEXT;