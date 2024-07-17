INSERT INTO  dm_ksusha.employees_statistic(marker, start_year, finish_year, empl_id, dep_id, pos_id, group_id, skill_id, 
level_id, level_change, level_change_total, avr_skill_level, empl_total_count, empl_count, empl_project_count,
empl_novice_count, empl_junior_count, empl_middle_count, empl_senior_count, empl_expert_count, empl_pct,
empl_project_pct, empl_novice_pct, empl_junior_pct, empl_middle_pct, empl_senior_pct, empl_expert_pct)
SELECT 'now' AS marker,
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
    cd."middle_%" ,
    cd."senior_%",
    cd."expert_%"
FROM dm_ksusha.now n
LEFT JOIN dm_ksusha.complex_data cd 
ON n."year" = cd.year_finish 
AND n.dep_id = cd.dep_id 
AND n.pos_id = cd.pos_id 
AND n.skill_id = cd.skill_id;

