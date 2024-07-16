INSERT INTO dm_ksusha.now (year, year_for_graph, empl_id, dep_id, pos_id, change_id, group_id, skill_id, level_id, level_num)
SELECT 2019 as year,
        2020 as year_for_graph, 
        sl.empl_id,
        e.dep_id,
        e.pos_id,
        MAX(sl.id),
        s.group_id,
        sl.skill_id,
        MAX(sl.level_id), 
        MAX(l.level_num)
FROM dds_ksusha.skills_levels AS sl 
LEFT JOIN dds_ksusha.employees AS e 
ON sl.empl_id = e.id
LEFT JOIN dds_ksusha.skills AS s
ON sl.skill_id = s.id 
LEFT JOIN dds_ksusha.levels AS l
ON sl.level_id = l.id
WHERE EXTRACT(year FROM sl.date)::INT <= 2019
GROUP BY sl.empl_id, e.dep_id, e.pos_id, s.group_id, sl.skill_id;

INSERT INTO dm_ksusha.now (year, year_for_graph, empl_id, dep_id, pos_id, change_id, group_id, skill_id, level_id, level_num)
SELECT 2020 as year, 
        2021 as year_for_graph,  
        sl.empl_id,
        e.dep_id,
        e.pos_id,
        MAX(sl.id),
        s.group_id,
        sl.skill_id,
        MAX(sl.level_id), 
        MAX(l.level_num)
FROM dds_ksusha.skills_levels AS sl 
LEFT JOIN dds_ksusha.employees AS e 
ON sl.empl_id = e.id
LEFT JOIN dds_ksusha.skills AS s
ON sl.skill_id = s.id 
LEFT JOIN dds_ksusha.levels AS l
ON sl.level_id = l.id
WHERE EXTRACT(year FROM sl.date)::INT <= 2020
GROUP BY sl.empl_id, e.dep_id, e.pos_id, s.group_id, sl.skill_id;

INSERT INTO dm_ksusha.now (year, year_for_graph, empl_id, dep_id, pos_id, change_id, group_id, skill_id, level_id, level_num)
SELECT 2021 as year, 
        2022 as year_for_graph,
        sl.empl_id,
        e.dep_id,
        e.pos_id,
        MAX(sl.id),
        s.group_id,
        sl.skill_id,
        MAX(sl.level_id), 
        MAX(l.level_num)
FROM dds_ksusha.skills_levels AS sl 
LEFT JOIN dds_ksusha.employees AS e 
ON sl.empl_id = e.id
LEFT JOIN dds_ksusha.skills AS s
ON sl.skill_id = s.id 
LEFT JOIN dds_ksusha.levels AS l
ON sl.level_id = l.id
WHERE EXTRACT(year FROM sl.date)::INT <= 2021
GROUP BY sl.empl_id, e.dep_id, e.pos_id, s.group_id, sl.skill_id;

INSERT INTO dm_ksusha.now (year, year_for_graph, empl_id, dep_id, pos_id, change_id, group_id, skill_id, level_id, level_num)
SELECT 2022 as year,
        2023 as year_for_graph,
        sl.empl_id,
        e.dep_id,
        e.pos_id,
       MAX(sl.id),
        s.group_id,
        sl.skill_id,
        MAX(sl.level_id), 
        MAX(l.level_num)
FROM dds_ksusha.skills_levels AS sl 
LEFT JOIN dds_ksusha.employees AS e 
ON sl.empl_id = e.id
LEFT JOIN dds_ksusha.skills AS s
ON sl.skill_id = s.id 
LEFT JOIN dds_ksusha.levels AS l
ON sl.level_id = l.id
WHERE EXTRACT(year FROM sl.date)::INT <= 2022
GROUP BY sl.empl_id, e.dep_id, e.pos_id, s.group_id, sl.skill_id;

INSERT INTO dm_ksusha.now (year, year_for_graph, empl_id, dep_id, pos_id, change_id, group_id, skill_id, level_id, level_num)
SELECT 2023 as year, 
        2024 as year_for_graph, 
        sl.empl_id,
        e.dep_id,
        e.pos_id,
        MAX(sl.id),
        s.group_id,
        sl.skill_id,
        MAX(sl.level_id), 
        MAX(l.level_num)
FROM dds_ksusha.skills_levels AS sl 
LEFT JOIN dds_ksusha.employees AS e 
ON sl.empl_id = e.id
LEFT JOIN dds_ksusha.skills AS s
ON sl.skill_id = s.id 
LEFT JOIN dds_ksusha.levels AS l
ON sl.level_id = l.id
WHERE EXTRACT(year FROM sl.date)::INT <= 2023
GROUP BY sl.empl_id, e.dep_id, e.pos_id, s.group_id, sl.skill_id;

INSERT INTO dm_ksusha.now (year, year_for_graph, empl_id, dep_id, pos_id, change_id, group_id, skill_id, level_id, level_num)
SELECT 2024 as year,
        2024 as year_for_graph, 
        sl.empl_id,
        e.dep_id,
        e.pos_id,
        MAX(sl.id),
        s.group_id,
        sl.skill_id,
        MAX(sl.level_id), 
        MAX(l.level_num)
FROM dds_ksusha.skills_levels AS sl 
LEFT JOIN dds_ksusha.employees AS e 
ON sl.empl_id = e.id
LEFT JOIN dds_ksusha.skills AS s
ON sl.skill_id = s.id 
LEFT JOIN dds_ksusha.levels AS l
ON sl.level_id = l.id
WHERE EXTRACT(year FROM sl.date)::INT <= 2024
GROUP BY sl.empl_id, e.dep_id, e.pos_id, s.group_id, sl.skill_id;