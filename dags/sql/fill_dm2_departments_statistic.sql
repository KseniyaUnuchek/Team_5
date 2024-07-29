INSERT INTO dm2_ksusha.departments_statistic (
    year_finish, dep_id, empl_id, group_id, skill_id, level_id, empl_total_count,
    empl_count, empl_project_count, empl_novice_count, empl_junior_count, empl_middle_count, empl_senior_count,
    empl_expert_count, for_rate_empl_skill, empl_skill_pct, empl_project_pct, empl_novice_pct, empl_junior_pct,
    empl_middle_pct, empl_senior_pct, empl_expert_pct
)
SELECT
    dp.year_finish,
    dp.dep_id,
    n.empl_id,
    dp.group_id,
    dp.skill_id,
    n.level_id,
    dp.employees,
    dp.employees_skill,
    dp.project,
    dp.novice,
    dp.junior,
    dp.middle,
    dp.senior,
    dp.expert,
    dp.for_rate_empl_skill,
    dp."employees_skill_%",
    dp."project_%",
    dp."novice_%",
    dp."junior_%",
    dp."middle_%",
    dp."senior_%",
    dp."expert_%"
FROM dm2_ksusha.dep_data AS dp
LEFT JOIN dm_ksusha.now AS n
    ON
        dp.year_finish = n."year"
        AND dp.dep_id = n.dep_id
        AND dp.group_id = n.group_id
        AND dp.skill_id = n.skill_id;
