CREATE TABLE IF NOT EXISTS dm_ksusha.now(
    id SERIAL NOT NULL PRIMARY KEY,
    year INT NOT NULL,
    year_for_graph INT NOT NULL,
    empl_id INT NOT NULL,
    dep_id INT NOT NULL,
    pos_id INT NOT NULL,
    change_id INT NOT NULL,
    group_id INT NOT NULL,
    skill_id INT NOT NULL,
    level_id INT NOT NULL,
    level_num INT NOT NULL
);

CREATE TABLE IF NOT EXISTS dm_ksusha.compare(
    id SERIAL NOT NULL PRIMARY KEY,
    start_year INT NOT NULL,
    finish_year INT NOT NULL,
    empl_id INT NOT NULL,
    dep_id INT NOT NULL,
    pos_id INT NOT NULL,
    change_id INT NOT NULL,
    group_id INT NOT NULL,
    skill_id INT NOT NULL,
    level_id INT NOT NULL,
    level_change INT NOT NULL
);

CREATE TABLE IF NOT EXISTS dm_ksusha.total_change(
    id SERIAL NOT NULL PRIMARY KEY,
    start_year INT NOT NULL,
    finish_year INT NOT NULL,
    empl_id INT NOT NULL,
    dep_id INT NOT NULL,
    pos_id INT NOT NULL,
    level_change_total INT NOT NULL
);

CREATE TABLE IF NOT EXISTS dm_ksusha.complex_date(
    id SERIAL NOT NULL PRIMARY KEY,
    year_finish INT NOT NULL,
    dep_id INT NOT NULL,
    pos_id INT NOT NULL,
    skill_id INT NOT NULL,
    employees INT NOT NULL,
    employees_skill INT NOT NULL,
    project INT NOT NULL,
    novice INT NOT NULL,
    junior INT NOT NULL,
    middle INT NOT NULL,
    senior INT NOT NULL,
    expert INT NOT NULL,
    "employees_skill_%" FLOAT NULL,
    "project_%" FLOAT NULL,
    "novice_%" FLOAT NULL,
    "junior_%" FLOAT NULL,
    "middle_%" FLOAT NULL,
    "senior_%" FLOAT NULL,
    "expert_%" FLOAT NULL,
    AVR_level_1 FLOAT NOT NULL,
    AVR_level_2 INT NULL

);
