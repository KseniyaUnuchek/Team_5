INSERT INTO dm_ksusha.total_change (start_year, finish_year, empl_id, dep_id, pos_id, level_change_total)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, SUM(level_change)
FROM dm_ksusha.compare c  
WHERE start_year = 2019
AND finish_year = 2020
GROUP BY start_year, finish_year, empl_id, dep_id, pos_id;

INSERT INTO dm_ksusha.total_change (start_year, finish_year, empl_id, dep_id, pos_id, level_change_total)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, SUM(level_change)
FROM dm_ksusha.compare c  
WHERE start_year = 2019
AND finish_year = 2021
GROUP BY start_year, finish_year, empl_id, dep_id, pos_id;

INSERT INTO dm_ksusha.total_change (start_year, finish_year, empl_id, dep_id, pos_id, level_change_total)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, SUM(level_change)
FROM dm_ksusha.compare c  
WHERE start_year = 2019
AND finish_year = 2022
GROUP BY start_year, finish_year, empl_id, dep_id, pos_id;

INSERT INTO dm_ksusha.total_change (start_year, finish_year, empl_id, dep_id, pos_id, level_change_total)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, SUM(level_change)
FROM dm_ksusha.compare c  
WHERE start_year = 2019
AND finish_year = 2023
GROUP BY start_year, finish_year, empl_id, dep_id, pos_id;

INSERT INTO dm_ksusha.total_change (start_year, finish_year, empl_id, dep_id, pos_id, level_change_total)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, SUM(level_change)
FROM dm_ksusha.compare c  
WHERE start_year = 2019
AND finish_year = 2024
GROUP BY start_year, finish_year, empl_id, dep_id, pos_id;

INSERT INTO dm_ksusha.total_change (start_year, finish_year, empl_id, dep_id, pos_id, level_change_total)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, SUM(level_change)
FROM dm_ksusha.compare c  
WHERE start_year = 2020
AND finish_year = 2021
GROUP BY start_year, finish_year, empl_id, dep_id, pos_id;

INSERT INTO dm_ksusha.total_change (start_year, finish_year, empl_id, dep_id, pos_id, level_change_total)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, SUM(level_change)
FROM dm_ksusha.compare c  
WHERE start_year = 2020
AND finish_year = 2022
GROUP BY start_year, finish_year, empl_id, dep_id, pos_id;

INSERT INTO dm_ksusha.total_change (start_year, finish_year, empl_id, dep_id, pos_id, level_change_total)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, SUM(level_change)
FROM dm_ksusha.compare c  
WHERE start_year = 2020
AND finish_year = 2023
GROUP BY start_year, finish_year, empl_id, dep_id, pos_id;

INSERT INTO dm_ksusha.total_change (start_year, finish_year, empl_id, dep_id, pos_id, level_change_total)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, SUM(level_change)
FROM dm_ksusha.compare c  
WHERE start_year = 2020
AND finish_year = 2024
GROUP BY start_year, finish_year, empl_id, dep_id, pos_id;

INSERT INTO dm_ksusha.total_change (start_year, finish_year, empl_id, dep_id, pos_id, level_change_total)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, SUM(level_change)
FROM dm_ksusha.compare c  
WHERE start_year = 2021
AND finish_year = 2022
GROUP BY start_year, finish_year, empl_id, dep_id, pos_id;

INSERT INTO dm_ksusha.total_change (start_year, finish_year, empl_id, dep_id, pos_id, level_change_total)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, SUM(level_change)
FROM dm_ksusha.compare c  
WHERE start_year = 2021
AND finish_year = 2023
GROUP BY start_year, finish_year, empl_id, dep_id, pos_id;

INSERT INTO dm_ksusha.total_change (start_year, finish_year, empl_id, dep_id, pos_id, level_change_total)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, SUM(level_change)
FROM dm_ksusha.compare c  
WHERE start_year = 2021
AND finish_year = 2024
GROUP BY start_year, finish_year, empl_id, dep_id, pos_id;

INSERT INTO dm_ksusha.total_change (start_year, finish_year, empl_id, dep_id, pos_id, level_change_total)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, SUM(level_change)
FROM dm_ksusha.compare c  
WHERE start_year = 2022
AND finish_year = 2023
GROUP BY start_year, finish_year, empl_id, dep_id, pos_id;

INSERT INTO dm_ksusha.total_change (start_year, finish_year, empl_id, dep_id, pos_id, level_change_total)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, SUM(level_change)
FROM dm_ksusha.compare c  
WHERE start_year = 2022
AND finish_year = 2024
GROUP BY start_year, finish_year, empl_id, dep_id, pos_id;

INSERT INTO dm_ksusha.total_change (start_year, finish_year, empl_id, dep_id, pos_id, level_change_total)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, SUM(level_change)
FROM dm_ksusha.compare c  
WHERE start_year = 2023
AND finish_year = 2024
GROUP BY start_year, finish_year, empl_id, dep_id, pos_id;

INSERT INTO dm_ksusha.total_change (start_year, finish_year, empl_id, dep_id, pos_id, level_change_total)
SELECT start_year, finish_year, empl_id, dep_id, pos_id, SUM(level_change)
FROM dm_ksusha.compare c  
WHERE start_year = 2024
AND finish_year = 2025
GROUP BY start_year, finish_year, empl_id, dep_id, pos_id;