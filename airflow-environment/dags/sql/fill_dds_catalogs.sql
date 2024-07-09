INSERT INTO dds_ksusha.skills_group (skill_group_name) 
SELECT unnest(array['фреймворки', 'технологии', 'языки программирования', 'среды разработки', 'инструменты', 'базы данных']);

INSERT INTO dds_ksusha.departments (department)
SELECT unnest(array(SELECT DISTINCT подразделения 
                    FROM ods_ksusha.сотрудники_дар 
                    WHERE (подразделения IS NOT NULL) AND (подразделения != '-') AND (подразделения != '')));

INSERT INTO dds_ksusha.positions (position)
SELECT unnest(array(SELECT DISTINCT должность 
                    FROM ods_ksusha.сотрудники_дар 
                    WHERE (должность IS NOT NULL) AND (должность != '-') AND (должность != '')));
