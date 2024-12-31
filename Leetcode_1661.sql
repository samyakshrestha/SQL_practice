-- Problem Description:
-- The task is to calculate the average time each machine takes to complete a process.
-- The time to complete a process is the 'end' timestamp minus the 'start' timestamp.
-- The average time is calculated by dividing the total time for all processes on the machine
-- by the number of processes run by the machine.
-- Input Table:
--   Activity:
--     - machine_id: ID of the machine.
--     - process_id: ID of the process running on the machine.
--     - activity_type: Enum ('start', 'end').
--     - timestamp: Float representing the current time in seconds.
-- Output Table:
--   - machine_id: ID of the machine.
--   - processing_time: Average processing time per process, rounded to 3 decimal places.

SELECT 
    machine_id,
    CAST(AVG(end_time - start_time) AS NUMERIC(10, 3)) AS processing_time
FROM (
    SELECT 
        machine_id,
        process_id,
        MAX(CASE WHEN activity_type = 'start' THEN timestamp END) AS start_time,
        MAX(CASE WHEN activity_type = 'end' THEN timestamp END) AS end_time
    FROM 
        Activity
    GROUP BY 
        machine_id, process_id
) process_times
GROUP BY 
    machine_id;
