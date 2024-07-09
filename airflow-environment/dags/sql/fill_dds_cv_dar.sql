INSERT INTO dds_ksusha.cv_dar(id, employee_id, activity)
SELECT "ResumeID", e.id, "Активность"
FROM ods_ksusha.резюмедар AS src
RIGHT JOIN dds_ksusha.employees AS e 
ON src."UserID" = e.id
WHERE "UserID" IS NOT NULL