INSERT INTO dm_ksusha.compare(start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, level_id, level_change)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, l.id, level_change
FROM (SELECT 2019 AS start_year, 
    2020 AS finish_year, 
    empl_id, 
    dep_id, 
    pos_id, 
    MAX(change_id) AS change_id, 
    group_id, 
    skill_id, 
    MAX(level_num) AS max_level_num,
    MAX(level_num)-MIN(level_num) AS level_change
FROM dm_ksusha.now AS n
WHERE n.year IN (2019, 2020) 
GROUP BY empl_id, dep_id, pos_id, group_id, skill_id) AS tt
LEFT JOIN dds_ksusha.levels AS l 
ON max_level_num = l.level_num;

INSERT INTO dm_ksusha.compare(start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, level_id, level_change)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, l.id, level_change
FROM (SELECT 2019 AS start_year, 
    2021 AS finish_year, 
    empl_id, 
    dep_id, 
    pos_id, 
    MAX(change_id) AS change_id, 
    group_id, 
    skill_id, 
    MAX(level_num) AS max_level_num,
    MAX(level_num)-MIN(level_num) AS level_change
FROM dm_ksusha.now AS n
WHERE n.year IN (2019, 2021) 
GROUP BY empl_id, dep_id, pos_id, group_id, skill_id) AS tt
LEFT JOIN dds_ksusha.levels AS l 
ON max_level_num = l.level_num;

INSERT INTO dm_ksusha.compare(start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, level_id, level_change)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, l.id, level_change
FROM (SELECT 2019 AS start_year, 
    2022 AS finish_year, 
    empl_id, 
    dep_id, 
    pos_id, 
    MAX(change_id) AS change_id, 
    group_id, 
    skill_id, 
    MAX(level_num) AS max_level_num,
    MAX(level_num)-MIN(level_num) AS level_change
FROM dm_ksusha.now AS n
WHERE n.year IN (2019, 2022) 
GROUP BY empl_id, dep_id, pos_id, group_id, skill_id) AS tt
LEFT JOIN dds_ksusha.levels AS l 
ON max_level_num = l.level_num;


INSERT INTO dm_ksusha.compare(start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, level_id, level_change)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, l.id, level_change
FROM (SELECT 2019 AS start_year, 
    2023 AS finish_year, 
    empl_id, 
    dep_id, 
    pos_id, 
    MAX(change_id) AS change_id, 
    group_id, 
    skill_id, 
    MAX(level_num) AS max_level_num,
    MAX(level_num)-MIN(level_num) AS level_change
FROM dm_ksusha.now AS n
WHERE n.year IN (2019, 2023) 
GROUP BY empl_id, dep_id, pos_id, group_id, skill_id) AS tt
LEFT JOIN dds_ksusha.levels AS l 
ON max_level_num = l.level_num;

INSERT INTO dm_ksusha.compare(start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, level_id, level_change)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, l.id, level_change
FROM (SELECT 2019 AS start_year, 
    2024 AS finish_year, 
    empl_id, 
    dep_id, 
    pos_id, 
    MAX(change_id) AS change_id, 
    group_id, 
    skill_id, 
    MAX(level_num) AS max_level_num,
    MAX(level_num)-MIN(level_num) AS level_change
FROM dm_ksusha.now AS n
WHERE n.year IN (2019, 2024) 
GROUP BY empl_id, dep_id, pos_id, group_id, skill_id) AS tt
LEFT JOIN dds_ksusha.levels AS l 
ON max_level_num = l.level_num;

INSERT INTO dm_ksusha.compare(start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, level_id, level_change)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, l.id, level_change
FROM (SELECT 2020 AS start_year, 
    2021 AS finish_year, 
    empl_id, 
    dep_id, 
    pos_id, 
    MAX(change_id) AS change_id, 
    group_id, 
    skill_id, 
    MAX(level_num) AS max_level_num,
    MAX(level_num)-MIN(level_num) AS level_change
FROM dm_ksusha.now AS n
WHERE n.year IN (2020, 2021) 
GROUP BY empl_id, dep_id, pos_id, group_id, skill_id) AS tt
LEFT JOIN dds_ksusha.levels AS l 
ON max_level_num = l.level_num;

INSERT INTO dm_ksusha.compare(start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, level_id, level_change)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, l.id, level_change
FROM (SELECT 2020 AS start_year, 
    2022 AS finish_year, 
    empl_id, 
    dep_id, 
    pos_id, 
    MAX(change_id) AS change_id, 
    group_id, 
    skill_id, 
    MAX(level_num) AS max_level_num,
    MAX(level_num)-MIN(level_num) AS level_change
FROM dm_ksusha.now AS n
WHERE n.year IN (2020, 2022) 
GROUP BY empl_id, dep_id, pos_id, group_id, skill_id) AS tt
LEFT JOIN dds_ksusha.levels AS l 
ON max_level_num = l.level_num;

INSERT INTO dm_ksusha.compare(start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, level_id, level_change)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, l.id, level_change
FROM (SELECT 2020 AS start_year, 
    2023 AS finish_year, 
    empl_id, 
    dep_id, 
    pos_id, 
    MAX(change_id) AS change_id, 
    group_id, 
    skill_id, 
    MAX(level_num) AS max_level_num,
    MAX(level_num)-MIN(level_num) AS level_change
FROM dm_ksusha.now AS n
WHERE n.year IN (2020, 2023) 
GROUP BY empl_id, dep_id, pos_id, group_id, skill_id) AS tt
LEFT JOIN dds_ksusha.levels AS l 
ON max_level_num = l.level_num;

INSERT INTO dm_ksusha.compare(start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, level_id, level_change)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, l.id, level_change
FROM (SELECT 2020 AS start_year, 
    2024 AS finish_year, 
    empl_id, 
    dep_id, 
    pos_id, 
    MAX(change_id) AS change_id, 
    group_id, 
    skill_id, 
    MAX(level_num) AS max_level_num,
    MAX(level_num)-MIN(level_num) AS level_change
FROM dm_ksusha.now AS n
WHERE n.year IN (2020, 2024) 
GROUP BY empl_id, dep_id, pos_id, group_id, skill_id) AS tt
LEFT JOIN dds_ksusha.levels AS l 
ON max_level_num = l.level_num;

INSERT INTO dm_ksusha.compare(start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, level_id, level_change)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, l.id, level_change
FROM (SELECT 2021 AS start_year, 
    2022 AS finish_year, 
    empl_id, 
    dep_id, 
    pos_id, 
    MAX(change_id) AS change_id, 
    group_id, 
    skill_id, 
    MAX(level_num) AS max_level_num,
    MAX(level_num)-MIN(level_num) AS level_change
FROM dm_ksusha.now AS n
WHERE n.year IN (2021, 2022) 
GROUP BY empl_id, dep_id, pos_id, group_id, skill_id) AS tt
LEFT JOIN dds_ksusha.levels AS l 
ON max_level_num = l.level_num;

INSERT INTO dm_ksusha.compare(start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, level_id, level_change)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, l.id, level_change
FROM (SELECT 2021 AS start_year, 
    2023 AS finish_year, 
    empl_id, 
    dep_id, 
    pos_id, 
    MAX(change_id) AS change_id, 
    group_id, 
    skill_id, 
    MAX(level_num) AS max_level_num,
    MAX(level_num)-MIN(level_num) AS level_change
FROM dm_ksusha.now AS n
WHERE n.year IN (2021, 2023) 
GROUP BY empl_id, dep_id, pos_id, group_id, skill_id) AS tt
LEFT JOIN dds_ksusha.levels AS l 
ON max_level_num = l.level_num;

INSERT INTO dm_ksusha.compare(start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, level_id, level_change)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, l.id, level_change
FROM (SELECT 2021 AS start_year, 
    2024 AS finish_year, 
    empl_id, 
    dep_id, 
    pos_id, 
    MAX(change_id) AS change_id, 
    group_id, 
    skill_id, 
    MAX(level_num) AS max_level_num,
    MAX(level_num)-MIN(level_num) AS level_change
FROM dm_ksusha.now AS n
WHERE n.year IN (2021, 2024) 
GROUP BY empl_id, dep_id, pos_id, group_id, skill_id) AS tt
LEFT JOIN dds_ksusha.levels AS l 
ON max_level_num = l.level_num;

INSERT INTO dm_ksusha.compare(start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, level_id, level_change)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, l.id, level_change
FROM (SELECT 2022 AS start_year, 
    2023 AS finish_year, 
    empl_id, 
    dep_id, 
    pos_id, 
    MAX(change_id) AS change_id, 
    group_id, 
    skill_id, 
    MAX(level_num) AS max_level_num,
    MAX(level_num)-MIN(level_num) AS level_change
FROM dm_ksusha.now AS n
WHERE n.year IN (2022, 2023) 
GROUP BY empl_id, dep_id, pos_id, group_id, skill_id) AS tt
LEFT JOIN dds_ksusha.levels AS l 
ON max_level_num = l.level_num;

INSERT INTO dm_ksusha.compare(start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, level_id, level_change)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, l.id, level_change
FROM (SELECT 2022 AS start_year, 
    2024 AS finish_year, 
    empl_id, 
    dep_id, 
    pos_id, 
    MAX(change_id) AS change_id, 
    group_id, 
    skill_id, 
    MAX(level_num) AS max_level_num,
    MAX(level_num)-MIN(level_num) AS level_change
FROM dm_ksusha.now AS n
WHERE n.year IN (2022, 2024) 
GROUP BY empl_id, dep_id, pos_id, group_id, skill_id) AS tt
LEFT JOIN dds_ksusha.levels AS l 
ON max_level_num = l.level_num;

INSERT INTO dm_ksusha.compare(start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, level_id, level_change)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, l.id, level_change
FROM (SELECT 2023 AS start_year, 
    2024 AS finish_year, 
    empl_id, 
    dep_id, 
    pos_id, 
    MAX(change_id) AS change_id, 
    group_id, 
    skill_id, 
    MAX(level_num) AS max_level_num,
    MAX(level_num)-MIN(level_num) AS level_change
FROM dm_ksusha.now AS n
WHERE n.year IN (2023, 2024) 
GROUP BY empl_id, dep_id, pos_id, group_id, skill_id) AS tt
LEFT JOIN dds_ksusha.levels AS l 
ON max_level_num = l.level_num;

INSERT INTO dm_ksusha.compare(start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, level_id, level_change)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, change_id, group_id, skill_id, l.id, level_change
FROM (SELECT 2024 AS start_year, 
    2025 AS finish_year, 
    empl_id, 
    dep_id, 
    pos_id, 
    MAX(change_id) AS change_id, 
    group_id, 
    skill_id, 
    MAX(level_num) AS max_level_num,
    MAX(level_num)-MIN(level_num) AS level_change
FROM dm_ksusha.now AS n
WHERE n.year IN (2024, 2025) 
GROUP BY empl_id, dep_id, pos_id, group_id, skill_id) AS tt
LEFT JOIN dds_ksusha.levels AS l 
ON max_level_num = l.level_num;