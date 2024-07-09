INSERT INTO dds_ksusha.employees(id, last_name, first_name, dep_id, FOC, pos_id)
SELECT src.id, фамилия, имя, d.id, цфо, p.id 
FROM ods_ksusha.сотрудники_дар AS src
LEFT JOIN dds_ksusha.positions AS p 
ON src.должность = p.position
LEFT JOIN dds_ksusha.departments AS d 
ON src.подразделения = d.department
WHERE 
    (должность IS NOT NULL) 
    AND (должность != '-') 
    AND (должность != '') 
    AND (подразделения IS NOT NULL) 
    AND (подразделения != '-') 
    AND (подразделения != '')