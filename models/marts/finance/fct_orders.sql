WITH orders AS(
    SELECT * FROM {{ref('stg_orders')}}
),

order_payments AS(
    SELECT 
        ORDER_ID,
        SUM(CASE WHEN STATUS = 'success' THEN AMOUNT END) AS AMOUNT
    FROM {{ref('stg_stripe_payments')}}
    GROUP BY ORDER_ID
)

SELECT 
    o.ORDER_ID,
    o.CUSTOMER_ID,
    op.AMOUNT
FROM orders o
LEFT JOIN order_payments op
ON o.ORDER_ID = op.ORDER_ID

