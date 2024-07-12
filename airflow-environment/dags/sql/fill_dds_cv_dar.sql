INSERT INTO dds_ksusha.cv_dar(id, empl_id, activity)
SELECT "ResumeID", "UserID", "Активность"
FROM ods_ksusha.резюмедар 
WHERE "Активность" LIKE '%Да%'
AND "ResumeID" IS NOT NULL
AND "UserID" IN (SELECT id FROM dds_ksusha.employees);

/* Заполнение слоя ошибок */
INSERT INTO bad_dds_ksusha.cv_dar(id, empl_id, activity)
SELECT "ResumeID", "UserID", "Активность"
FROM ods_ksusha.резюмедар 
WHERE "Активность" IS NULL
OR "Активность" = ''
OR "Активность" = '-'
OR "ResumeID" IS NULL
OR "ResumeID" = 0
OR "UserID" IS NULL
OR "UserID" = 0;