INSERT INTO dm_ksusha.employees_statistic (
    marker, start_year, finish_year, empl_id, dep_id, pos_id, group_id, skill_id,
    level_id, level_change, level_change_total, avr_skill_level, empl_total_count, empl_count, empl_project_count,
    empl_novice_count, empl_junior_count, empl_middle_count, empl_senior_count, empl_expert_count, empl_pct,
    empl_project_pct, empl_novice_pct, empl_junior_pct, empl_middle_pct, empl_senior_pct, empl_expert_pct
)
SELECT
    'NOW' AS marker,
    n."year" AS start_year,
    n."year" AS finish_year,
    n.empl_id,
    n.dep_id,
    n.pos_id,
    n.group_id,
    n.skill_id,
    n.level_id,
    0 AS level_change,
    0 AS level_change_total,
    cd.avr_level_2 AS avr_skill_level,
    cd.employees AS empl_total_count,
    cd.employees_skill AS empl_count,
    cd.project,
    cd.novice,
    cd.junior,
    cd.middle,
    cd.senior,
    cd.expert,
    cd."employees_skill_%",
    cd."project_%",
    cd."novice_%",
    cd."junior_%",
    cd."middle_%",
    cd."senior_%",
    cd."expert_%"
FROM dm_ksusha.now AS n
LEFT JOIN dm_ksusha.complex_data AS cd
    ON
        n."year" = cd.year_finish
        AND n.dep_id = cd.dep_id
        AND n.pos_id = cd.pos_id
        AND n.skill_id = cd.skill_id;

INSERT INTO dm_ksusha.employees_statistic (
    marker, start_year, finish_year, empl_id, dep_id, pos_id, group_id, skill_id,
    level_id, level_change, level_change_total, avr_skill_level, empl_total_count, empl_count, empl_project_count,
    empl_novice_count, empl_junior_count, empl_middle_count, empl_senior_count, empl_expert_count, empl_pct,
    empl_project_pct, empl_novice_pct, empl_junior_pct, empl_middle_pct, empl_senior_pct, empl_expert_pct
)
SELECT
    'CHANGE' AS marker,
    c.start_year,
    c.finish_year,
    c.empl_id,
    c.dep_id,
    c.pos_id,
    c.group_id,
    c.skill_id,
    c.level_id,
    c.level_change,
    tc.level_change_total,
    cd.avr_level_2 AS avr_skill_level,
    cd.employees AS empl_total_count,
    cd.employees_skill AS empl_count,
    cd.project,
    cd.novice,
    cd.junior,
    cd.middle,
    cd.senior,
    cd.expert,
    cd."employees_skill_%",
    cd."project_%",
    cd."novice_%",
    cd."junior_%",
    cd."middle_%",
    cd."senior_%",
    cd."expert_%"
FROM dm_ksusha.compare AS c
LEFT JOIN dm_ksusha.total_change AS tc
    ON
        c.start_year = tc.start_year
        AND c.finish_year = tc.finish_year
        AND c.empl_id = tc.empl_id
        AND c.dep_id = tc.dep_id
        AND c.pos_id = tc.pos_id
LEFT JOIN dm_ksusha.complex_data AS cd
    ON
        c.finish_year = cd.year_finish
        AND c.dep_id = cd.dep_id
        AND c.pos_id = cd.pos_id
        AND c.skill_id = cd.skill_id;
