CREATE TABLE IF NOT EXISTS dds_ksusha.skills_group (
    id INT NOT NULL PRIMARY KEY,
    skill_group_name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS dds_ksusha.skills (
    id INT NOT NULL PRIMARY KEY,
    skill_name VARCHAR(50) NOT NULL,
    group_id INT NOT NULL REFERENCES dds_ksusha.skills_group(id)
);

CREATE TABLE IF NOT EXISTS dds_ksusha.levels (
    id INT NOT NULL PRIMARY KEY,
    level VARCHAR(50) NOT NULL,
    skill_num INT NOT NULL
);
CREATE TABLE IF NOT EXISTS dds_ksusha.departments (
    id INT NOT NULL PRIMARY KEY,
    department VARCHAR(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS dds_ksusha.positions (
    id INT NOT NULL PRIMARY KEY,
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

CREATE TABLE IF NOT EXISTS dds_ksusha.skills_levels (
    employee_id INT NOT NULL REFERENCES dds_ksusha.employees(id),
    skill_id INT NOT NULL REFERENCES dds_ksusha.skills(id),
    level_id INT NOT NULL REFERENCES dds_ksusha.levels(id),
    date DATE NOT NULL,
    level_num INT NOT NULL,
    group_id INT NOT NULL,
    id_cv INT NOT NULL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS dds_ksusha.departments_position (
    id INT NOT NULL PRIMARY KEY,
    dep_id INT NOT NULL REFERENCES dds_ksusha.departments(id),
    pos_id INT NOT NULL REFERENCES dds_ksusha.positions(id)
);
