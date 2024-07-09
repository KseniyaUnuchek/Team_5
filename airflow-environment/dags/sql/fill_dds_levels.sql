INSERT INTO dds_ksusha.levels(level, level_num)
SELECT название, id FROM ods_ksusha.уровни_знаний;

UPDATE dds_ksusha.levels SET level_num = 1
WHERE level = 'Использовал на проекте';

UPDATE dds_ksusha.levels SET level_num = 2
WHERE level = 'Novice';

UPDATE dds_ksusha.levels SET level_num = 3
WHERE level = 'Junior';

UPDATE dds_ksusha.levels SET level_num = 4
WHERE level = 'Middle';

UPDATE dds_ksusha.levels SET level_num = 5
WHERE level = 'Senior';

UPDATE dds_ksusha.levels SET level_num = 6
WHERE level = 'Expert';