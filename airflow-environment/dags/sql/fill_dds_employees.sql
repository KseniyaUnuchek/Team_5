INSERT INTO dds_ksusha.employees(id, last_name, first_name, dep_id, FOC, pos_id)
SELECT src.id, фамилия, имя, d.id, цфо, p.id 
FROM ods_ksusha.сотрудники_дар AS src
LEFT JOIN dds_ksusha.positions AS p 
ON src.должность = p.position
LEFT JOIN dds_ksusha.departments AS d 
ON src.подразделения = d.department
WHERE должность IS NOT NULL
AND должность != '-'
AND должность != ''
AND должность != ' '
AND подразделения IS NOT NULL
AND подразделения != '-'
AND подразделения != ''
AND подразделения != ' '
AND src.id IN (SELECT "UserID"
                FROM ods_ksusha.резюмедар 
                WHERE "Активность" LIKE '%Да%'
                AND "ResumeID" IS NOT NULL
                AND "UserID" IS NOT NULL);

/* Исправляю исходные данные о департаментах на очищенные*/
UPDATE dds_ksusha.departments
SET department = trim(regexp_replace(department, '[\.\s]+', ' ','g'));

/* Заполнение слоя ошибок */
INSERT INTO bad_dds_ksusha.employees(id, last_name, first_name, dep_id, FOC, pos_id)
SELECT src.id, фамилия, имя, d.id, цфо, p.id 
FROM ods_ksusha.сотрудники_дар AS src
LEFT JOIN dds_ksusha.positions AS p 
ON src.должность = p.position
LEFT JOIN dds_ksusha.departments AS d 
ON src.подразделения = d.department
    WHERE подразделения IS NULL 
    OR подразделения = '-'
    OR подразделения = ''
    OR подразделения = ' '
    OR src.id IS NULL
    OR src.id = 0
    OR должность IS NULL
    OR должность = '-'
    OR должность = ''
    OR должность = ' ';
