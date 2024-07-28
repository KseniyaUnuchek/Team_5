INSERT INTO dm2_ksusha.dep_data (year_finish, dep_id, group_id, skill_id, employees, employees_skill, project, novice,
junior, middle, senior, expert, for_rate_empl_skill)
SELECT "year" AS year_finish,
        dep_id,
        group_id,
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
        COUNT (DISTINCT CASE
                        WHEN level_id IN (115638,115639,115640,115641)
                        THEN empl_id
                    END) AS for_rate_empl_skill
FROM dm_ksusha.now n
GROUP BY "year", dep_id, group_id, skill_id;

UPDATE dm2_ksusha.dep_data
SET "employees_skill_%" = employees_skill*100.0/employees;

UPDATE dm2_ksusha.dep_data
SET "employees_skill_%" = ROUND("employees_skill_%"::numeric);

UPDATE dm2_ksusha.dep_data
SET "project_%" = project*100.0/(CASE
				                WHEN employees_skill = 0
				                THEN 1
				                ELSE employees_skill
				            END),
    "novice_%" = novice*100.0/(CASE
				                WHEN employees_skill = 0
				                THEN 1
				                ELSE employees_skill
				            END),
    "junior_%" = junior*100.0/(CASE
				                WHEN employees_skill = 0
				                THEN 1
				                ELSE employees_skill
				            END),
    "middle_%" = middle*100.0/(CASE
				                WHEN employees_skill = 0
				                THEN 1
				                ELSE employees_skill
				            END),
    "senior_%" = senior*100.0/(CASE
				                WHEN employees_skill = 0
				                THEN 1
				                ELSE employees_skill
				            END),
    "expert_%" = expert*100.0/(CASE
				                WHEN employees_skill = 0
				                THEN 1
				                ELSE employees_skill
				            END);

UPDATE dm2_ksusha.dep_data
SET "project_%" = ROUND("project_%"::numeric),
	"novice_%" = ROUND("novice_%"::numeric),
	"junior_%" = ROUND("junior_%"::numeric),
	"middle_%" = ROUND("middle_%"::numeric),
	"senior_%" = ROUND("senior_%"::numeric),
	"expert_%" = ROUND("expert_%"::numeric);

WITH department_totals AS (
    SELECT year_finish,
			dep_id,
			group_id,
			skill_id,
           ("project_%") + ("novice_%") + ("junior_%") + ("middle_%") + ("senior_%") + ("expert_%") AS total_percentage,
			CASE
            	CASE
            	WHEN ("project_%") + ("novice_%") + ("junior_%") + ("middle_%") + ("senior_%") + ("expert_%") = 0
            	THEN 0
            	WHEN ("project_%") + ("novice_%") + ("junior_%") + ("middle_%") + ("senior_%") + ("expert_%") != 100
            	THEN 100 - ("project_%") - ("novice_%") - ("junior_%") - ("middle_%") - ("senior_%") - ("expert_%")
            	ELSE 0
			END AS adjustment_value,
			CASE
				WHEN "project_%" = GREATEST("project_%", "novice_%", "junior_%", "middle_%", "senior_%", "expert_%") THEN 'project_%'
				WHEN "novice_%" = GREATEST("project_%", "novice_%", "junior_%", "middle_%", "senior_%", "expert_%") THEN 'novice_%'
				WHEN "junior_%" = GREATEST("project_%", "novice_%", "junior_%", "middle_%", "senior_%", "expert_%") THEN 'junior_%'
				WHEN "middle_%" = GREATEST("project_%", "novice_%", "junior_%", "middle_%", "senior_%", "expert_%") THEN 'middle_%'
				WHEN "senior_%" = GREATEST("project_%", "novice_%", "junior_%", "middle_%", "senior_%", "expert_%") THEN 'senior_%'
				WHEN "expert_%" = GREATEST("project_%", "novice_%", "junior_%", "middle_%", "senior_%", "expert_%") THEN 'expert_%'
				ELSE NULL
			END AS max_percentage_field
    FROM dm2_ksusha.dep_data
)

UPDATE dm2_ksusha.dep_data  AS d
SET
    "project_%" = CASE
					WHEN dt.max_percentage_field = 'project_%' AND dt.adjustment_value != 0 THEN d."project_%" + dt.adjustment_value
					ELSE d."project_%"
				END,
	"novice_%" = CASE
					WHEN dt.max_percentage_field = 'novice_%' AND dt.adjustment_value != 0 THEN d."novice_%" + dt.adjustment_value
					ELSE d."novice_%"
				END,
	"junior_%" = CASE
					WHEN dt.max_percentage_field = 'junior_%' AND dt.adjustment_value != 0 THEN d."junior_%" + dt.adjustment_value
					ELSE d."junior_%"
				END,
	"middle_%" = CASE
					WHEN dt.max_percentage_field = 'middle_%' AND dt.adjustment_value != 0 THEN d."middle_%" + dt.adjustment_value
					ELSE d."middle_%"
				END,
	"senior_%" = CASE
					WHEN dt.max_percentage_field = 'senior_%' AND dt.adjustment_value != 0 THEN d."senior_%" + dt.adjustment_value
					ELSE d."senior_%"
				END,
	"expert_%" = CASE
					WHEN dt.max_percentage_field = 'expert_%' AND dt.adjustment_value != 0 THEN d."expert_%" + dt.adjustment_value
					ELSE d."expert_%"
    			END
FROM department_totals AS dt
WHERE d.year_finish = dt.year_finish
    AND d.dep_id = dt.dep_id
    AND d.group_id = dt.group_id
    AND d.skill_id = dt.skill_id
    AND dt.total_percentage > 0;