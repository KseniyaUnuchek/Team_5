INSERT INTO dds_ksusha.cv_dar(id, empl_id, activity)
SELECT "ResumeID", "UserID", "Активность"
FROM ods_ksusha.резюмедар 
WHERE "Активность" LIKE '%Да%'
AND "ResumeID" IS NOT NULL
AND "UserID" IN (SELECT id FROM dds_ksusha.employees);