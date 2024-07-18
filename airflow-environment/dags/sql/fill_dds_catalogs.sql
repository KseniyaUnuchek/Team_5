INSERT INTO dds_ksusha.skills_group (id, skill_group_name) VALUES
    (1, 'базы данных'),
    (2, 'инструменты'),
    (3, 'платформы'),
    (4, 'среды разработки'),
    (5, 'технологии'),
    (6, 'фреймворки'),
    (7, 'языки программирования'),
    (8, 'отрасли'),
    (9, 'предметные области');

INSERT INTO dds_ksusha.m_departaments(old_department)
SELECT trim(regexp_replace(подразделения, '[\.\s]+', ' ','g'))
FROM ods_ksusha.сотрудники_дар 
WHERE подразделения IS NOT NULL 
AND подразделения != '-'
AND подразделения != ''
AND подразделения != ' '
GROUP BY trim(regexp_replace(подразделения, '[\.\s]+', ' ','g'));

UPDATE dds_ksusha.m_departaments
SET department = old_department;

UPDATE dds_ksusha.m_departaments
SET department = 'Data Platform: Центр компетенций'
WHERE department LIKE '%Data Platform группа%';

UPDATE dds_ksusha.m_departaments
SET department = 'Направление BI'
WHERE department LIKE '% BI%' OR department LIKE '%Группа Центров Компетенций%';

UPDATE dds_ksusha.m_departaments
SET department = 'Бизнес-аналитика. Общая практика'
WHERE department LIKE '%Бизнес-аналитика общей практики: Центр компетенций%';

UPDATE dds_ksusha.m_departaments
SET department = 'Sales, Marketing & Business Development'
WHERE department LIKE '%SMBD%';

UPDATE dds_ksusha.m_departaments
SET department = 'Направление DWH&ML'
WHERE department LIKE '%Направление DWH&ML%';

UPDATE dds_ksusha.m_departaments
SET department = 'Группа технической поддержки РЖД'
WHERE department LIKE '%Группа технической поддержки РЖД%';

UPDATE dds_ksusha.m_departaments
SET department = 'Бизнес-аналитика по работе с гос.компаниями'
WHERE department LIKE '%Бизнес-аналитика по работе с гос компаниями%';

UPDATE dds_ksusha.m_departaments
SET department = 'Управление проектами РЖД'
WHERE department LIKE '%Центр компетенций по управлению проектами РЖД%';

INSERT INTO dds_ksusha.positions (position)
SELECT должность
FROM ods_ksusha.сотрудники_дар 
WHERE должность IS NOT NULL
AND должность != '-' 
AND должность != ''
AND должность != ' '
GROUP BY должность;

/* Заполнения слоя ошибок */
INSERT INTO bad_dds_ksusha.departments (empl_id,department)
    SELECT id, подразделения
    FROM ods_ksusha.сотрудники_дар 
    WHERE подразделения IS NULL 
    OR подразделения = '-'
    OR подразделения = ''
    OR подразделения = ' '
    OR id IS NULL
    OR id = 0;

INSERT INTO bad_dds_ksusha.positions (empl_id,position)
    SELECT id, должность 
    FROM ods_ksusha.сотрудники_дар 
    WHERE должность IS NULL
    OR должность = '-'
    OR должность = ''
    OR должность = ' '
    OR id IS NULL
    OR id = 0;
