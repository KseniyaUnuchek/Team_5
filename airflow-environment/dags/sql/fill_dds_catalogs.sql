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

/* Заполнение маппинг-таблицы m_departments*/
INSERT INTO dds_ksusha.m_departments(old_department)
SELECT trim(regexp_replace(подразделения, '[\.\s]+', ' ','g'))
FROM ods_ksusha.сотрудники_дар 
WHERE подразделения IS NOT NULL 
AND подразделения != '-'
AND подразделения != ''
AND подразделения != ' '
GROUP BY trim(regexp_replace(подразделения, '[\.\s]+', ' ','g'));

UPDATE dds_ksusha.m_departments
SET department = old_department;

UPDATE dds_ksusha.m_departments
SET department = 'Data Platform: Центр компетенций'
WHERE department LIKE '%Data Platform группа%';

UPDATE dds_ksusha.m_departments
SET department = 'Направление BI'
WHERE department LIKE '% BI%' OR department LIKE '%Группа Центров Компетенций%';

UPDATE dds_ksusha.m_departments
SET department = 'Бизнес-аналитика. Общая практика'
WHERE department LIKE '%Бизнес-аналитика общей практики: Центр компетенций%';

UPDATE dds_ksusha.m_departments
SET department = 'Sales, Marketing & Business Development'
WHERE department LIKE '%SMBD%';

UPDATE dds_ksusha.m_departments
SET department = 'Направление DWH&ML'
WHERE department LIKE '%Направление DWH&ML%';

UPDATE dds_ksusha.m_departments
SET department = 'Группа технической поддержки РЖД'
WHERE department LIKE '%Группа технической поддержки РЖД%';

UPDATE dds_ksusha.m_departments
SET department = 'Бизнес-аналитика по работе с гос.компаниями'
WHERE department LIKE '%Бизнес-аналитика по работе с гос компаниями%';

UPDATE dds_ksusha.m_departments
SET department = 'Управление проектами РЖД'
WHERE department LIKE '%Центр компетенций по управлению проектами РЖД%';

UPDATE dds_ksusha.m_departments md
SET id = (
    SELECT old_id
    FROM dds_ksusha.m_departments md2
    WHERE md.department = md2.old_department
)
WHERE EXISTS (
    SELECT 1
    FROM dds_ksusha.m_departments md2
    WHERE md.department = md2.old_department
);

UPDATE dds_ksusha.m_departments 
SET id = old_id
WHERE id IS NULL;

/* Заполнение таблицы-справочника departments*/

INSERT INTO dds_ksusha.departments (id, department)
SELECT id, department
FROM dds_ksusha.m_departments
GROUP BY id, department;

/* Заполнение маппинг-таблицы m_position*/

INSERT INTO dds_ksusha.m_positions (old_position)
SELECT должность
FROM ods_ksusha.сотрудники_дар 
WHERE должность IS NOT NULL
AND должность != '-' 
AND должность != ''
AND должность != ' '
GROUP BY должность;

UPDATE dds_ksusha.m_positions
SET position = old_position;

UPDATE dds_ksusha.m_positions
SET position = 'Aналитик'
WHERE position LIKE '%Аналитик,Департамент систем бизнес-аналитики%';

UPDATE dds_ksusha.m_positions
SET position = 'Инженер автоматизации технологических процессов'
WHERE position LIKE '%Инженер по автоматизации технологических процессов%';

UPDATE dds_ksusha.m_positions
SET position = 'Инженер автоматизации технологических процессов'
WHERE position LIKE '%Инженер по автоматизации технологических процессов%';

UPDATE dds_ksusha.m_positions
SET position = 'Руководитель группы разработки'
WHERE position LIKE '%Руководитель группы разработок%';

UPDATE dds_ksusha.m_positions
SET position = 'Старший системный аналитик'
WHERE position LIKE '%старший системный аналитик%';

UPDATE dds_ksusha.m_positions
SET position = 'Руководитель проектов'
WHERE position LIKE '%руководитель проектов%';

UPDATE dds_ksusha.m_positions mp
SET id = (
    SELECT old_id
    FROM dds_ksusha.m_positions mp2
    WHERE mp.position = mp2.old_position
)
WHERE EXISTS (
    SELECT 1
    FROM dds_ksusha.m_positions mp2
    WHERE mp.position= mp2.old_position
);

UPDATE dds_ksusha.m_positions 
SET id = old_id
WHERE id IS NULL;

/* Заполнение таблицы-справочника positions*/

INSERT INTO dds_ksusha.positions (id, position)
SELECT id, position
FROM dds_ksusha.m_positions
GROUP BY id, position;

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
