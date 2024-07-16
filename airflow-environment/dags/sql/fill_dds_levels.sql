INSERT INTO dds_ksusha.levels(id, level, level_num)
SELECT id, название, id FROM ods_ksusha.уровни_знаний;

UPDATE dds_ksusha.levels 
SET level_num = 1
WHERE id = 283045;

UPDATE dds_ksusha.levels 
SET level_num = 2
WHERE id = 115637;

UPDATE dds_ksusha.levels 
SET level_num = 3
WHERE id = 115638;

UPDATE dds_ksusha.levels 
SET level_num = 4
WHERE id = 115639;

UPDATE dds_ksusha.levels 
SET level_num = 5
WHERE id = 115640;

UPDATE dds_ksusha.levels 
SET level_num = 6
WHERE id = 115641;

INSERT INTO dds_ksusha.levels(id, level, level_num)
SELECT id, название, id FROM ods_ksusha.уровни_знаний_в_отрасли;

UPDATE dds_ksusha.levels
SET level_num = 11
WHERE id = 115772;

UPDATE dds_ksusha.levels
SET level_num = 12
WHERE id = 115773;

UPDATE dds_ksusha.levels
SET level_num = 13
WHERE id = 115774;

INSERT INTO dds_ksusha.levels(id, level, level_num)
SELECT id, название, id FROM ods_ksusha.уровни_знаний_в_предметной_област;

UPDATE dds_ksusha.levels
SET level_num = 21
WHERE id = 115761;

UPDATE dds_ksusha.levels
SET level_num = 22
WHERE id = 115762;

UPDATE dds_ksusha.levels
SET level_num = 23
WHERE id = 115763;

INSERT INTO dds_ksusha.levels(id, level, level_num)
VALUES (0, 'Не владеет', 0);