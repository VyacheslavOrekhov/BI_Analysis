-- Матрица переходов между статусами DPD
SELECT
    prev_status,
    curr_status,
    COUNT(*) AS loans_count,
    ROUND(COUNT(*)::numeric /
          SUM(COUNT(*)) OVER (PARTITION BY prev_status), 4) AS roll_rate
FROM status_transitions
GROUP BY prev_status, curr_status
ORDER BY prev_status, curr_status;
