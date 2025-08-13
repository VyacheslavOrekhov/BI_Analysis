-- Расчёт PD: доля дефолтов среди выданных в когорте
WITH cohort AS (
    SELECT
        issue_month,
        COUNT(*) AS loans_issued,
        SUM(CASE WHEN default_flag = 1 THEN 1 ELSE 0 END) AS defaults
    FROM loans
    GROUP BY issue_month
)
SELECT
    issue_month,
    loans_issued,
    defaults,
    ROUND(defaults::numeric / loans_issued, 4) AS pd
FROM cohort
ORDER BY issue_month;
