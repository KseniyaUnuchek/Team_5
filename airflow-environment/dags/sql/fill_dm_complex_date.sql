INSERT INTO dm_ksusha.complex_date(year_finish, dep_id, pos_id, skill_id, employees, employees_skill, project,
novice, junior, middle, senior, expert, AVR_level_1, AVR_level_2)
SELECT
	"year", 
	dep_id, 
	pos_id, 
	skill_id, 
	COUNT(DISTINCT empl_id) AS employees, 
	COUNT(DISTINCT CASE
						WHEN level_id != 0 
						THEN empl_id 
					END) AS employees_skill,
	COUNT(DISTINCT CASE 
						WHEN level_id = 283045 
						THEN empl_id 
					END) AS project,
	COUNT(DISTINCT CASE 
						WHEN level_id = 115637 
						THEN empl_id 
					END) AS novice,
	COUNT(DISTINCT CASE 
						WHEN level_id = 115638 
						THEN empl_id 
					END) AS junior,
	COUNT(DISTINCT CASE
						WHEN level_id = 115639 
						THEN empl_id 
					END) AS middle,
	COUNT(DISTINCT CASE 
						WHEN level_id = 115640 
						THEN empl_id
					END) AS senior,
	COUNT(DISTINCT CASE 
						WHEN level_id = 115641 
						THEN empl_id 
					END) AS expert,
	ROUND(CASE
		WHEN AVG(CASE 
					WHEN level_num != 0 
					THEN level_num 
					ELSE NULL 
				END) IS NULL 
		THEN 0
		ELSE AVG(CASE 
					WHEN level_num != 0 
					THEN level_num 
					ELSE NULL 
				END)
		END, 2) AS AVR_level_1,
    ROUND(CASE
			WHEN AVG(CASE
						WHEN level_num != 0 
						THEN level_num 
						ELSE NULL 
					END) IS NULL 
			THEN 0
			ELSE AVG(CASE 
						WHEN level_num != 0 
						THEN level_num 
						ELSE NULL 
					END)
		END) AS AVR_level_2  
FROM
	dm_ksusha.now
GROUP BY "year",
		dep_id,
		pos_id,
		skill_id;

UPDATE dm_ksusha.complex_date
SET "employees_skill_%" = employees_skill*100.0/employees;

UPDATE dm_ksusha.complex_date
SET "employees_skill_%" = ROUND("employees_skill_%"::numeric, 2);

UPDATE dm_ksusha.complex_date
SET "project_%" = project*100.0/(CASE
				                WHEN employees_skill = 0
				                THEN 1
				                ELSE employees_skill
				            END);

UPDATE dm_ksusha.complex_date
SET "project_%" = ROUND("project_%"::numeric, 2);

UPDATE dm_ksusha.complex_date
SET "novice_%" = novice*100.0/(CASE
				                WHEN employees_skill = 0
				                THEN 1
				                ELSE employees_skill
				            END);

UPDATE dm_ksusha.complex_date
SET "novice_%" = ROUND("novice_%"::numeric, 2);

UPDATE dm_ksusha.complex_date
SET "middle_%" = middle*100.0/(CASE
				                WHEN employees_skill = 0
				                THEN 1
				                ELSE employees_skill
				            END);  

UPDATE dm_ksusha.complex_date
SET "middle_%" = ROUND("middle_%"::numeric, 2);

UPDATE dm_ksusha.complex_date
SET "senior_%" = senior*100.0/(CASE
				                WHEN employees_skill = 0
				                THEN 1
				                ELSE employees_skill
				            END); 

UPDATE dm_ksusha.complex_date
SET "senior_%"= ROUND("senior_%"::numeric, 2);

UPDATE dm_ksusha.complex_date
SET "expert_%" = expert*100.0/(CASE
				                WHEN employees_skill = 0
				                THEN 1
				                ELSE employees_skill
				            END);

UPDATE dm_ksusha.complex_date
SET "expert_%"= ROUND("expert_%"::numeric, 2);

UPDATE dm_ksusha.complex_date
SET "junior_%" = CASE
                    WHEN junior != 0
                    THEN 100.0-"project_%"-"novice_%"-"middle_%"-"senior_%"-"expert_%"
                    ELSE 0
                END;
