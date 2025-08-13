-- Анализ качества портфеля по "возрасту" выдачи
WITH base AS (
    SELECT
        loan_id,
        issue_month,
        months_on_book,
        default_flag
    FROM loan_performance
)
SELECT
    issue_month,
    months_on_book,
    COUNT(*) AS loans_total,
    SUM(default_flag) AS defaults,
    ROUND(SUM(default_flag)::numeric / COUNT(*), 4) AS default_rate
FROM base
GROUP BY issue_month, months_on_book
ORDER BY issue_month, months_on_book;
