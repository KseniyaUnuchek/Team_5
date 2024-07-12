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

INSERT INTO dds_ksusha.departments (department)
SELECT unnest(array(SELECT DISTINCT подразделения
                    FROM ods_ksusha.сотрудники_дар 
                    WHERE (подразделения IS NOT NULL) 
                    AND (подразделения != '-') 
                    AND (подразделения != '')));

INSERT INTO dds_ksusha.positions (position)
SELECT unnest(array(SELECT DISTINCT должность 
                    FROM ods_ksusha.сотрудники_дар 
                    WHERE должность IS NOT NULL
                    AND должность != '-' 
                    AND должность != ''));

/*Заполнения слоя ошибок*/
INSERT INTO bad_dds_ksusha.departments (empl_id,department)
    SELECT id, подразделения
    FROM ods_ksusha.сотрудники_дар 
    WHERE подразделения IS NULL 
    OR подразделения = '-'
    OR подразделения = ''
    OR id IS NULL
    OR id = 0;

INSERT INTO bad_dds_ksusha.positions (empl_id,position)
    SELECT id, должность 
    FROM ods_ksusha.сотрудники_дар 
    WHERE должность IS NULL
    OR должность = '-'
    OR должность = ''
    OR id IS NULL
    OR id = 0;
