SELECT 
    su.user_id,
    ROUND(
        IFNULL(SUM(cn.action = 'confirmed'), 0) / IF(COUNT(cn.user_id) > 0, COUNT(cn.user_id), 1),
        2
    ) AS confirmation_rate
FROM Signups su
LEFT JOIN Confirmations cn
ON su.user_id = cn.user_id
GROUP BY su.user_id;
