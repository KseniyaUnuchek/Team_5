CREATE TABLE IF NOT EXISTS dds_ksusha.skills_group (
    id INT NOT NULL PRIMARY KEY,
    skill_group_name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS dds_ksusha.skills (
    id INT NOT NULL PRIMARY KEY,
    skill_name VARCHAR(100) NOT NULL,
    group_id INT NOT NULL REFERENCES dds_ksusha.skills_group(id)
);

CREATE TABLE IF NOT EXISTS dds_ksusha.levels (
    id INT NOT NULL PRIMARY KEY,
    level VARCHAR(100) NOT NULL,
    level_num INT NOT NULL
);

CREATE TABLE IF NOT EXISTS dds_ksusha.departments (
    id SERIAL NOT NULL PRIMARY KEY,
    department TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS dds_ksusha.positions (
    id SERIAL NOT NULL PRIMARY KEY,
    position VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS dds_ksusha.employees (
    id INT NOT NULL PRIMARY KEY,
    last_name VARCHAR(50) NULL,
    first_name VARCHAR(50) NULL,
    dep_id INT NOT NULL REFERENCES dds_ksusha.departments(id),
    FOC VARCHAR(50) NOT NULL,
    pos_id INT NOT NULL REFERENCES dds_ksusha.positions(id)
);

CREATE TABLE IF NOT EXISTS dds_ksusha.cv_dar (
    id INT NOT NULL PRIMARY KEY,
    empl_id INT NOT NULL,
    activity VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS dds_ksusha.skills_levels (
    id INT NOT NULL PRIMARY KEY,
    empl_id INT NOT NULL REFERENCES dds_ksusha.employees(id),
    skill_id INT NOT NULL REFERENCES dds_ksusha.skills(id),
    level_id INT NOT NULL REFERENCES dds_ksusha.levels(id),
    date DATE NOT NULL
);

