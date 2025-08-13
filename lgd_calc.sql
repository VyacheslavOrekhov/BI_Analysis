-- LGD: доля невозвращённых средств от EAD
SELECT
    loan_id,
    ead,                -- Exposure at Default
    recoveries,         -- Возврат после дефолта
    ROUND( (ead - recoveries) / NULLIF(ead,0), 4 ) AS lgd
FROM defaulted_loans;
