DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_tables WHERE schemaname = 'dm2_ksusha' AND tablename = 'employees') THEN
        CREATE TABLE dm2_ksusha.employees (
            LIKE dds_ksusha.employees INCLUDING ALL
        );
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_tables WHERE schemaname = 'dm2_ksusha' AND tablename = 'departments') THEN
        CREATE TABLE dm2_ksusha.departments (
            LIKE dds_ksusha.departments INCLUDING ALL
        );
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_tables WHERE schemaname = 'dm2_ksusha' AND tablename = 'positions') THEN
        CREATE TABLE dm2_ksusha.positions (
            LIKE dds_ksusha.positions INCLUDING ALL
        );
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_tables WHERE schemaname = 'dm2_ksusha' AND tablename = 'skills_group') THEN
        CREATE TABLE dm2_ksusha.skills_group (
            LIKE dds_ksusha.skills_group INCLUDING ALL
        );
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_tables WHERE schemaname = 'dm2_ksusha' AND tablename = 'skills') THEN
        CREATE TABLE dm2_ksusha.skills (
            LIKE dds_ksusha.skills INCLUDING ALL
        );
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_tables WHERE schemaname = 'dm2_ksusha' AND tablename = 'levels') THEN
        CREATE TABLE dm2_ksusha.levels (
            LIKE dds_ksusha.levels INCLUDING ALL
        );
    END IF;
END
$$;

CREATE TABLE IF NOT EXISTS dm2_ksusha.dep_data(
    id SERIAL NOT NULL PRIMARY KEY,
    year_finish INT NOT NULL,
    dep_id INT NOT NULL,
    group_id INT NOT NULL,
    skill_id INT NOT NULL,
    employees INT NOT NULL,
    employees_skill INT NOT NULL,
    project INT NOT NULL,
    novice INT NOT NULL,
    junior INT NOT NULL,
    middle INT NOT NULL,
    senior INT NOT NULL,
    expert INT NOT NULL,
    for_rate_empl_skill INT NOT NULL,
    "employees_skill_%" FLOAT NULL,
    "project_%" FLOAT NULL,
    "novice_%" FLOAT NULL,
    "junior_%" FLOAT NULL,
    "middle_%" FLOAT NULL,
    "senior_%" FLOAT NULL,
    "expert_%" FLOAT NULL
);

CREATE TABLE IF NOT EXISTS dm2_ksusha.departments_statistic(
    id SERIAL NOT NULL PRIMARY KEY,
    year_finish INT NOT NULL,
    dep_id INT NOT NULL,
    empl_id INT NOT NULL,
    group_id INT NOT NULL,
    skill_id INT NOT NULL,
    level_id INT NOT NULL,
    empl_total_count INT NOT NULL,
    empl_count INT NOT NULL,
    empl_project_count INT NOT NULL,
    empl_novice_count INT NOT NULL,
    empl_junior_count INT NOT NULL,
    empl_middle_count INT NOT NULL,
    empl_senior_count INT NOT NULL,
    empl_expert_count INT NOT NULL,
    for_rate_empl_skill INT NOT NULL,
    empl_skill_pct FLOAT NULL,
    empl_project_pct FLOAT NULL,
    empl_novice_pct FLOAT NULL,
    empl_junior_pct FLOAT NULL,
    empl_middle_pct FLOAT NULL,
    empl_senior_pct FLOAT NULL,
    empl_expert_pct FLOAT NULL
);