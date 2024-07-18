INSERT INTO dm_ksusha.skills_group(id, skill_group_name)
SELECT * 
FROM dds_ksusha.skills_group;

INSERT INTO dm_ksusha.skills(id, skill_name, group_id)
SELECT *
FROM dds_ksusha.skills;

INSERT INTO dm_ksusha.levels(id, level, level_num)
SELECT *
FROM dds_ksusha.levels;