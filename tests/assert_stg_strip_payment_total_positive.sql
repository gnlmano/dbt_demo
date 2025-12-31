SELECT 
    order_id,
    SUM(amount) total_amount
FROM {{ ref('stg_stripe_payments') }}
GROUP BY order_id
HAVING total_amount < 0
