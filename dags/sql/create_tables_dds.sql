CREATE TABLE IF NOT EXISTS dds_ksusha.skills_group (
    id INT NOT NULL PRIMARY KEY,
    skill_group_name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS dds_ksusha.skills (
    id INT NOT NULL PRIMARY KEY,
    skill_name VARCHAR(100) NOT NULL,
    group_id INT NOT NULL REFERENCES dds_ksusha.skills_group (id)
);

CREATE TABLE IF NOT EXISTS dds_ksusha.levels (
    id INT NOT NULL PRIMARY KEY,
    level VARCHAR(100) NOT NULL,
    level_num INT NOT NULL
);

CREATE TABLE IF NOT EXISTS dds_ksusha.departments (
    id INT NOT NULL PRIMARY KEY,
    department TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS dds_ksusha.positions (
    id INT NOT NULL PRIMARY KEY,
    position VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS dds_ksusha.employees (
    id INT NOT NULL PRIMARY KEY,
    last_name VARCHAR(50) NULL,
    first_name VARCHAR(50) NULL,
    dep_id INT NOT NULL REFERENCES dds_ksusha.departments (id),
    foc VARCHAR(50) NOT NULL,
    pos_id INT NOT NULL REFERENCES dds_ksusha.positions (id)
);

CREATE TABLE IF NOT EXISTS dds_ksusha.cv_dar (
    id INT NOT NULL PRIMARY KEY,
    empl_id INT NOT NULL REFERENCES dds_ksusha.employees (id),
    activity VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS dds_ksusha.skills_levels (
    id INT NOT NULL PRIMARY KEY,
    empl_id INT NOT NULL REFERENCES dds_ksusha.employees (id),
    skill_id INT NOT NULL REFERENCES dds_ksusha.skills (id),
    level_id INT NOT NULL REFERENCES dds_ksusha.levels (id),
    date DATE NOT NULL
);
/* Создание маппинг-таблиц */

CREATE TABLE IF NOT EXISTS dds_ksusha.m_departments (
    old_id SERIAL NOT NULL,
    id INT NULL,
    old_department TEXT NOT NULL,
    department TEXT NULL
);

CREATE TABLE IF NOT EXISTS dds_ksusha.m_positions (
    old_id SERIAL NOT NULL,
    id INT NULL,
    old_position VARCHAR(50) NOT NULL,
    position VARCHAR(50) NULL
);

/* Создание слоя данных с ошибками */
CREATE TABLE IF NOT EXISTS bad_dds_ksusha.skills_group (
    id VARCHAR(50) NULL,
    skill_group_name VARCHAR(50) NULL
);

CREATE TABLE IF NOT EXISTS bad_dds_ksusha.skills (
    id VARCHAR(50) NULL,
    skill_name VARCHAR(100) NULL,
    group_id VARCHAR(50) NULL
);

CREATE TABLE IF NOT EXISTS bad_dds_ksusha.levels (
    id VARCHAR(50) NULL,
    level VARCHAR(100) NULL,
    level_num VARCHAR(50) NULL
);

CREATE TABLE IF NOT EXISTS bad_dds_ksusha.departments (
    empl_id VARCHAR(50) NULL NULL,
    department TEXT NULL
);

CREATE TABLE IF NOT EXISTS bad_dds_ksusha.positions (
    empl_id VARCHAR(50) NULL,
    position VARCHAR(50) NULL
);

CREATE TABLE IF NOT EXISTS bad_dds_ksusha.employees (
    id VARCHAR(50) NULL,
    last_name VARCHAR(50) NULL,
    first_name VARCHAR(50) NULL,
    dep_id VARCHAR(50) NULL,
    foc VARCHAR(50) NULL,
    pos_id VARCHAR(50) NULL
);

CREATE TABLE IF NOT EXISTS bad_dds_ksusha.cv_dar (
    id VARCHAR(50) NULL,
    empl_id VARCHAR(50) NULL,
    activity VARCHAR(50) NULL
);

CREATE TABLE IF NOT EXISTS bad_dds_ksusha.skills_levels (
    id VARCHAR(50) NULL,
    empl_id VARCHAR(50) NULL,
    skill_id VARCHAR(50) NULL,
    level_id VARCHAR(50) NULL,
    date VARCHAR(50) NULL
);
