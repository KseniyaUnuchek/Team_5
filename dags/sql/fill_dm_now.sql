CREATE TEMPORARY TABLE cross_table AS
SELECT  e.id AS empl_id,
        dep_id AS dep_id,
        pos_id AS pos_id,
        s.id AS skill_id,
        0 AS level_id
    FROM dds_ksusha.employees e
    CROSS JOIN dds_ksusha.skills s;

INSERT INTO dm_ksusha.now (year, year_for_graph, empl_id, dep_id, pos_id, change_id, group_id, skill_id, level_id, level_num)
WITH
empty_levels AS (
    SELECT
        2019 AS "year",
        2020 AS year_for_graph,
        crt.empl_id,
        crt.dep_id,
        crt.pos_id,
        0 AS max_skill_level_change_id,
        s.group_id,
        crt.skill_id,
        crt.level_id AS max_level_id,
        0 AS max_level_num
    FROM cross_table AS crt
    LEFT JOIN dds_ksusha.employees AS e ON crt.empl_id = e.id
    LEFT JOIN dds_ksusha.skills AS s ON crt.skill_id = s.id
    LEFT JOIN dds_ksusha.levels AS l ON crt.level_id = l.id
),
filled_levels AS (
    SELECT
        2019 AS "year",
        2020 AS year_for_graph,
        sl.empl_id,
        e.dep_id,
        e.pos_id,
        MAX(sl.id) AS max_skill_level_change_id,
        s.group_id,
        sl.skill_id,
        MAX(sl.level_id) AS max_level_id,
        MAX(l.level_num) AS max_level_num
    FROM dds_ksusha.skills_levels AS sl
    LEFT JOIN dds_ksusha.employees AS e ON sl.empl_id = e.id
    LEFT JOIN dds_ksusha.skills AS s ON sl.skill_id = s.id
    LEFT JOIN dds_ksusha.levels AS l ON sl.level_id = l.id
    WHERE sl.date <= '31-03-2019'::DATE
    GROUP BY sl.empl_id, e.dep_id, e.pos_id, s.group_id, sl.skill_id
)
SELECT
    COALESCE(f.year, e.year) AS "year",
    COALESCE(f.year_for_graph, e.year_for_graph) AS year_for_graph,
    COALESCE(f.empl_id, e.empl_id) AS empl_id,
    COALESCE(f.dep_id, e.dep_id) AS dep_id,
    COALESCE(f.pos_id, e.pos_id) AS pos_id,
    COALESCE(f.max_skill_level_change_id, e.max_skill_level_change_id) AS max_skill_level_change_id,
    COALESCE(f.group_id, e.group_id) AS group_id,
    COALESCE(f.skill_id, e.skill_id) AS skill_id,
    COALESCE(f.max_level_id, e.max_level_id) AS max_level_id,
    COALESCE(f.max_level_num, e.max_level_num) AS max_level_num
FROM empty_levels e
LEFT JOIN filled_levels f
ON e.empl_id = f.empl_id AND e.skill_id = f.skill_id;

INSERT INTO dm_ksusha.now (year, year_for_graph, empl_id, dep_id, pos_id, change_id, group_id, skill_id, level_id, level_num)
WITH
empty_levels AS (
    SELECT
        2020 AS "year",
        2021 AS year_for_graph,
        crt.empl_id,
        crt.dep_id,
        crt.pos_id,
        0 AS max_skill_level_change_id,
        s.group_id,
        crt.skill_id,
        crt.level_id AS max_level_id,
        0 AS max_level_num
    FROM cross_table AS crt
    LEFT JOIN dds_ksusha.employees AS e ON crt.empl_id = e.id
    LEFT JOIN dds_ksusha.skills AS s ON crt.skill_id = s.id
    LEFT JOIN dds_ksusha.levels AS l ON crt.level_id = l.id
),
filled_levels AS (
    SELECT
        2020 AS "year",
        2021 AS year_for_graph,
        sl.empl_id,
        e.dep_id,
        e.pos_id,
        MAX(sl.id) AS max_skill_level_change_id,
        s.group_id,
        sl.skill_id,
        MAX(sl.level_id) AS max_level_id,
        MAX(l.level_num) AS max_level_num
    FROM dds_ksusha.skills_levels AS sl
    LEFT JOIN dds_ksusha.employees AS e ON sl.empl_id = e.id
    LEFT JOIN dds_ksusha.skills AS s ON sl.skill_id = s.id
    LEFT JOIN dds_ksusha.levels AS l ON sl.level_id = l.id
    WHERE sl.date <= '31-03-2020'::DATE
    GROUP BY sl.empl_id, e.dep_id, e.pos_id, s.group_id, sl.skill_id
)
SELECT
    COALESCE(f.year, e.year) AS "year",
    COALESCE(f.year_for_graph, e.year_for_graph) AS year_for_graph,
    COALESCE(f.empl_id, e.empl_id) AS empl_id,
    COALESCE(f.dep_id, e.dep_id) AS dep_id,
    COALESCE(f.pos_id, e.pos_id) AS pos_id,
    COALESCE(f.max_skill_level_change_id, e.max_skill_level_change_id) AS max_skill_level_change_id,
    COALESCE(f.group_id, e.group_id) AS group_id,
    COALESCE(f.skill_id, e.skill_id) AS skill_id,
    COALESCE(f.max_level_id, e.max_level_id) AS max_level_id,
    COALESCE(f.max_level_num, e.max_level_num) AS max_level_num
FROM empty_levels e
LEFT JOIN filled_levels f
ON e.empl_id = f.empl_id AND e.skill_id = f.skill_id;

INSERT INTO dm_ksusha.now (year, year_for_graph, empl_id, dep_id, pos_id, change_id, group_id, skill_id, level_id, level_num)
WITH
empty_levels AS (
    SELECT
        2021 AS "year",
        2022 AS year_for_graph,
        crt.empl_id,
        crt.dep_id,
        crt.pos_id,
        0 AS max_skill_level_change_id,
        s.group_id,
        crt.skill_id,
        crt.level_id AS max_level_id,
        0 AS max_level_num
    FROM cross_table AS crt
    LEFT JOIN dds_ksusha.employees AS e ON crt.empl_id = e.id
    LEFT JOIN dds_ksusha.skills AS s ON crt.skill_id = s.id
    LEFT JOIN dds_ksusha.levels AS l ON crt.level_id = l.id
),
filled_levels AS (
    SELECT
        2021 AS "year",
        2022 AS year_for_graph,
        sl.empl_id,
        e.dep_id,
        e.pos_id,
        MAX(sl.id) AS max_skill_level_change_id,
        s.group_id,
        sl.skill_id,
        MAX(sl.level_id) AS max_level_id,
        MAX(l.level_num) AS max_level_num
    FROM dds_ksusha.skills_levels AS sl
    LEFT JOIN dds_ksusha.employees AS e ON sl.empl_id = e.id
    LEFT JOIN dds_ksusha.skills AS s ON sl.skill_id = s.id
    LEFT JOIN dds_ksusha.levels AS l ON sl.level_id = l.id
    WHERE sl.date <= '31-03-2021'::DATE
    GROUP BY sl.empl_id, e.dep_id, e.pos_id, s.group_id, sl.skill_id
)
SELECT
    COALESCE(f.year, e.year) AS "year",
    COALESCE(f.year_for_graph, e.year_for_graph) AS year_for_graph,
    COALESCE(f.empl_id, e.empl_id) AS empl_id,
    COALESCE(f.dep_id, e.dep_id) AS dep_id,
    COALESCE(f.pos_id, e.pos_id) AS pos_id,
    COALESCE(f.max_skill_level_change_id, e.max_skill_level_change_id) AS max_skill_level_change_id,
    COALESCE(f.group_id, e.group_id) AS group_id,
    COALESCE(f.skill_id, e.skill_id) AS skill_id,
    COALESCE(f.max_level_id, e.max_level_id) AS max_level_id,
    COALESCE(f.max_level_num, e.max_level_num) AS max_level_num
FROM empty_levels e
LEFT JOIN filled_levels f
ON e.empl_id = f.empl_id AND e.skill_id = f.skill_id;

INSERT INTO dm_ksusha.now (year, year_for_graph, empl_id, dep_id, pos_id, change_id, group_id, skill_id, level_id, level_num)
WITH
empty_levels AS (
    SELECT
        2022 AS "year",
        2023 AS year_for_graph,
        crt.empl_id,
        crt.dep_id,
        crt.pos_id,
        0 AS max_skill_level_change_id,
        s.group_id,
        crt.skill_id,
        crt.level_id AS max_level_id,
        0 AS max_level_num
    FROM cross_table AS crt
    LEFT JOIN dds_ksusha.employees AS e ON crt.empl_id = e.id
    LEFT JOIN dds_ksusha.skills AS s ON crt.skill_id = s.id
    LEFT JOIN dds_ksusha.levels AS l ON crt.level_id = l.id
),
filled_levels AS (
    SELECT
        2022 AS "year",
        2023 AS year_for_graph,
        sl.empl_id,
        e.dep_id,
        e.pos_id,
        MAX(sl.id) AS max_skill_level_change_id,
        s.group_id,
        sl.skill_id,
        MAX(sl.level_id) AS max_level_id,
        MAX(l.level_num) AS max_level_num
    FROM dds_ksusha.skills_levels AS sl
    LEFT JOIN dds_ksusha.employees AS e ON sl.empl_id = e.id
    LEFT JOIN dds_ksusha.skills AS s ON sl.skill_id = s.id
    LEFT JOIN dds_ksusha.levels AS l ON sl.level_id = l.id
    WHERE sl.date <= '31-03-2022'::DATE
    GROUP BY sl.empl_id, e.dep_id, e.pos_id, s.group_id, sl.skill_id
)
SELECT
    COALESCE(f.year, e.year) AS "year",
    COALESCE(f.year_for_graph, e.year_for_graph) AS year_for_graph,
    COALESCE(f.empl_id, e.empl_id) AS empl_id,
    COALESCE(f.dep_id, e.dep_id) AS dep_id,
    COALESCE(f.pos_id, e.pos_id) AS pos_id,
    COALESCE(f.max_skill_level_change_id, e.max_skill_level_change_id) AS max_skill_level_change_id,
    COALESCE(f.group_id, e.group_id) AS group_id,
    COALESCE(f.skill_id, e.skill_id) AS skill_id,
    COALESCE(f.max_level_id, e.max_level_id) AS max_level_id,
    COALESCE(f.max_level_num, e.max_level_num) AS max_level_num
FROM empty_levels e
LEFT JOIN filled_levels f
ON e.empl_id = f.empl_id AND e.skill_id = f.skill_id;

INSERT INTO dm_ksusha.now (year, year_for_graph, empl_id, dep_id, pos_id, change_id, group_id, skill_id, level_id, level_num)
WITH
empty_levels AS (
    SELECT
        2023 AS "year",
        2024 AS year_for_graph,
        crt.empl_id,
        crt.dep_id,
        crt.pos_id,
        0 AS max_skill_level_change_id,
        s.group_id,
        crt.skill_id,
        crt.level_id AS max_level_id,
        0 AS max_level_num
    FROM cross_table AS crt
    LEFT JOIN dds_ksusha.employees AS e ON crt.empl_id = e.id
    LEFT JOIN dds_ksusha.skills AS s ON crt.skill_id = s.id
    LEFT JOIN dds_ksusha.levels AS l ON crt.level_id = l.id
),
filled_levels AS (
    SELECT
        2023 AS "year",
        2024 AS year_for_graph,
        sl.empl_id,
        e.dep_id,
        e.pos_id,
        MAX(sl.id) AS max_skill_level_change_id,
        s.group_id,
        sl.skill_id,
        MAX(sl.level_id) AS max_level_id,
        MAX(l.level_num) AS max_level_num
    FROM dds_ksusha.skills_levels AS sl
    LEFT JOIN dds_ksusha.employees AS e ON sl.empl_id = e.id
    LEFT JOIN dds_ksusha.skills AS s ON sl.skill_id = s.id
    LEFT JOIN dds_ksusha.levels AS l ON sl.level_id = l.id
    WHERE sl.date <= '31-03-2023'::DATE
    GROUP BY sl.empl_id, e.dep_id, e.pos_id, s.group_id, sl.skill_id
)
SELECT
    COALESCE(f.year, e.year) AS "year",
    COALESCE(f.year_for_graph, e.year_for_graph) AS year_for_graph,
    COALESCE(f.empl_id, e.empl_id) AS empl_id,
    COALESCE(f.dep_id, e.dep_id) AS dep_id,
    COALESCE(f.pos_id, e.pos_id) AS pos_id,
    COALESCE(f.max_skill_level_change_id, e.max_skill_level_change_id) AS max_skill_level_change_id,
    COALESCE(f.group_id, e.group_id) AS group_id,
    COALESCE(f.skill_id, e.skill_id) AS skill_id,
    COALESCE(f.max_level_id, e.max_level_id) AS max_level_id,
    COALESCE(f.max_level_num, e.max_level_num) AS max_level_num
FROM empty_levels e
LEFT JOIN filled_levels f
ON e.empl_id = f.empl_id AND e.skill_id = f.skill_id;

INSERT INTO dm_ksusha.now (year, year_for_graph, empl_id, dep_id, pos_id, change_id, group_id, skill_id, level_id, level_num)
WITH
empty_levels AS (
    SELECT
        2024 AS "year",
        2025 AS year_for_graph,
        crt.empl_id,
        crt.dep_id,
        crt.pos_id,
        0 AS max_skill_level_change_id,
        s.group_id,
        crt.skill_id,
        crt.level_id AS max_level_id,
        0 AS max_level_num
    FROM cross_table AS crt
    LEFT JOIN dds_ksusha.employees AS e ON crt.empl_id = e.id
    LEFT JOIN dds_ksusha.skills AS s ON crt.skill_id = s.id
    LEFT JOIN dds_ksusha.levels AS l ON crt.level_id = l.id
),
filled_levels AS (
    SELECT
        2024 AS "year",
        2025 AS year_for_graph,
        sl.empl_id,
        e.dep_id,
        e.pos_id,
        MAX(sl.id) AS max_skill_level_change_id,
        s.group_id,
        sl.skill_id,
        MAX(sl.level_id) AS max_level_id,
        MAX(l.level_num) AS max_level_num
    FROM dds_ksusha.skills_levels AS sl
    LEFT JOIN dds_ksusha.employees AS e ON sl.empl_id = e.id
    LEFT JOIN dds_ksusha.skills AS s ON sl.skill_id = s.id
    LEFT JOIN dds_ksusha.levels AS l ON sl.level_id = l.id
    WHERE sl.date <= '31-03-2024'::DATE
    GROUP BY sl.empl_id, e.dep_id, e.pos_id, s.group_id, sl.skill_id
)
SELECT
    COALESCE(f.year, e.year) AS "year",
    COALESCE(f.year_for_graph, e.year_for_graph) AS year_for_graph,
    COALESCE(f.empl_id, e.empl_id) AS empl_id,
    COALESCE(f.dep_id, e.dep_id) AS dep_id,
    COALESCE(f.pos_id, e.pos_id) AS pos_id,
    COALESCE(f.max_skill_level_change_id, e.max_skill_level_change_id) AS max_skill_level_change_id,
    COALESCE(f.group_id, e.group_id) AS group_id,
    COALESCE(f.skill_id, e.skill_id) AS skill_id,
    COALESCE(f.max_level_id, e.max_level_id) AS max_level_id,
    COALESCE(f.max_level_num, e.max_level_num) AS max_level_num
FROM empty_levels e
LEFT JOIN filled_levels f
ON e.empl_id = f.empl_id AND e.skill_id = f.skill_id;

INSERT INTO dm_ksusha.now (year, year_for_graph, empl_id, dep_id, pos_id, change_id, group_id, skill_id, level_id, level_num)
WITH
empty_levels AS (
    SELECT
        2025 AS "year",
        2026 AS year_for_graph,
        crt.empl_id,
        crt.dep_id,
        crt.pos_id,
        0 AS max_skill_level_change_id,
        s.group_id,
        crt.skill_id,
        crt.level_id AS max_level_id,
        0 AS max_level_num
    FROM cross_table AS crt
    LEFT JOIN dds_ksusha.employees AS e ON crt.empl_id = e.id
    LEFT JOIN dds_ksusha.skills AS s ON crt.skill_id = s.id
    LEFT JOIN dds_ksusha.levels AS l ON crt.level_id = l.id
),
filled_levels AS (
    SELECT
        2025 AS "year",
        2026 AS year_for_graph,
        sl.empl_id,
        e.dep_id,
        e.pos_id,
        MAX(sl.id) AS max_skill_level_change_id,
        s.group_id,
        sl.skill_id,
        MAX(sl.level_id) AS max_level_id,
        MAX(l.level_num) AS max_level_num
    FROM dds_ksusha.skills_levels AS sl
    LEFT JOIN dds_ksusha.employees AS e ON sl.empl_id = e.id
    LEFT JOIN dds_ksusha.skills AS s ON sl.skill_id = s.id
    LEFT JOIN dds_ksusha.levels AS l ON sl.level_id = l.id
    WHERE sl.date <= '31-03-2025'::DATE
    GROUP BY sl.empl_id, e.dep_id, e.pos_id, s.group_id, sl.skill_id
)
SELECT
    COALESCE(f.year, e.year) AS "year",
    COALESCE(f.year_for_graph, e.year_for_graph) AS year_for_graph,
    COALESCE(f.empl_id, e.empl_id) AS empl_id,
    COALESCE(f.dep_id, e.dep_id) AS dep_id,
    COALESCE(f.pos_id, e.pos_id) AS pos_id,
    COALESCE(f.max_skill_level_change_id, e.max_skill_level_change_id) AS max_skill_level_change_id,
    COALESCE(f.group_id, e.group_id) AS group_id,
    COALESCE(f.skill_id, e.skill_id) AS skill_id,
    COALESCE(f.max_level_id, e.max_level_id) AS max_level_id,
    COALESCE(f.max_level_num, e.max_level_num) AS max_level_num
FROM empty_levels e
LEFT JOIN filled_levels f
ON e.empl_id = f.empl_id AND e.skill_id = f.skill_id;