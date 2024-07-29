INSERT INTO dm_ksusha.complex_data (
    year_finish, dep_id, pos_id, skill_id, employees, employees_skill, project,
    novice, junior, middle, senior, expert, avr_level_1, avr_level_2
)
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
        WHEN
            AVG(CASE
                WHEN level_num != 0
                    THEN level_num
            END) IS NULL
            THEN 0
        ELSE AVG(CASE
            WHEN level_num != 0
                THEN level_num
        END)
    END, 2) AS avr_level_1,
    ROUND(CASE
        WHEN
            AVG(CASE
                WHEN level_num != 0
                    THEN level_num
            END) IS NULL
            THEN 0
        ELSE AVG(CASE
            WHEN level_num != 0
                THEN level_num
        END)
    END) AS avr_level_2
FROM
    dm_ksusha.now
GROUP BY
    "year",
    dep_id,
    pos_id,
    skill_id;

UPDATE dm_ksusha.complex_data
SET "employees_skill_%" = employees_skill * 100.0 / employees;

UPDATE dm_ksusha.complex_data
SET "employees_skill_%" = ROUND("employees_skill_%"::numeric, 2);

UPDATE dm_ksusha.complex_data
SET "project_%" = project * 100.0 / (CASE
    WHEN employees_skill = 0
        THEN 1
    ELSE employees_skill
END);

UPDATE dm_ksusha.complex_data
SET "novice_%" = novice * 100.0 / (CASE
    WHEN employees_skill = 0
        THEN 1
    ELSE employees_skill
END);

UPDATE dm_ksusha.complex_data
SET "junior_%" = junior * 100.0 / (CASE
    WHEN employees_skill = 0
        THEN 1
    ELSE employees_skill
END);

UPDATE dm_ksusha.complex_data
SET "middle_%" = middle * 100.0 / (CASE
    WHEN employees_skill = 0
        THEN 1
    ELSE employees_skill
END);

UPDATE dm_ksusha.complex_data
SET "senior_%" = senior * 100.0 / (CASE
    WHEN employees_skill = 0
        THEN 1
    ELSE employees_skill
END);

UPDATE dm_ksusha.complex_data
SET "expert_%" = expert * 100.0 / (CASE
    WHEN employees_skill = 0
        THEN 1
    ELSE employees_skill
END);

UPDATE dm_ksusha.complex_data
SET
    "project_%" = ROUND("project_%"::numeric),
    "novice_%" = ROUND("novice_%"::numeric),
    "junior_%" = ROUND("junior_%"::numeric),
    "middle_%" = ROUND("middle_%"::numeric),
    "senior_%" = ROUND("senior_%"::numeric),
    "expert_%" = ROUND("expert_%"::numeric);

WITH department_totals AS (
    SELECT
        year_finish,
        dep_id,
        pos_id,
        skill_id,
        ("project_%") + ("novice_%") + ("junior_%") + ("middle_%") + ("senior_%") + ("expert_%") AS total_percentage,
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
        END AS max_percentage_field
    FROM dm_ksusha.complex_data
)

UPDATE dm_ksusha.complex_data AS d
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
WHERE
    d.year_finish = dt.year_finish
    AND d.dep_id = dt.dep_id
    AND d.pos_id = dt.pos_id
    AND d.skill_id = dt.skill_id
    AND dt.total_percentage > 0;
