-- EAD: остаток основного долга + начисленные проценты + невыбранный лимит с CCF
SELECT
    loan_id,
    principal_os,
    accrued_interest,
    undrawn_limit,
    ccf,  -- Credit Conversion Factor, например 0.75
    principal_os + accrued_interest + (undrawn_limit * ccf) AS ead
FROM loan_balances;
