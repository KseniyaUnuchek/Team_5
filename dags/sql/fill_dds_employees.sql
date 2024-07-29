INSERT INTO dds_ksusha.employees (id, last_name, first_name, dep_id, foc, pos_id)
SELECT
    src.id,
    src."фамилия",
    src."имя",
    d.id AS dep_id,
    src."цфо",
    p.id AS pos_id
FROM ods_ksusha."сотрудники_дар" AS src
LEFT JOIN dds_ksusha.m_positions AS p
    ON src."должность" = p.old_position
LEFT JOIN dds_ksusha.m_departments AS d
    ON trim(regexp_replace(src."подразделения", '[\.\s]+', ' ', 'g')) = d.old_department
WHERE
    src."должность" IS NOT NULL
    AND src."должность" != '-'
    AND src."должность" != ''
    AND src."должность" != ' '
    AND src."подразделения" IS NOT NULL
    AND src."подразделения" != '-'
    AND src."подразделения" != ''
    AND src."подразделения" != ' '
    AND src.id IN (
        SELECT "UserID"
        FROM ods_ksusha."резюмедар"
        WHERE
            "Активность" LIKE '%Да%'
            AND "ResumeID" IS NOT NULL
            AND "UserID" IS NOT NULL
    );

/* Добавление имен-заглушек */
UPDATE dds_ksusha.employees
SET last_name = 'Иванов';

UPDATE dds_ksusha.employees
SET first_name = 'Иван' || id;



/* Заполнение слоя ошибок */
INSERT INTO bad_dds_ksusha.employees (id, last_name, first_name, dep_id, foc, pos_id)
SELECT
    src.id,
    src."фамилия",
    src."имя",
    d.id AS dep_id,
    src."цфо",
    p.id AS pos_id
FROM ods_ksusha."сотрудники_дар" AS src
LEFT JOIN dds_ksusha.positions AS p
    ON src."должность" = p.position
LEFT JOIN dds_ksusha.departments AS d
    ON src."подразделения" = d.department
WHERE
    src."подразделения" IS NULL
    OR src."подразделения" = '-'
    OR src."подразделения" = ''
    OR src."подразделения" = ' '
    OR src.id IS NULL
    OR src.id = 0
    OR src."должность" IS NULL
    OR src."должность" = '-'
    OR src."должность" = ''
    OR src."должность" = ' ';
