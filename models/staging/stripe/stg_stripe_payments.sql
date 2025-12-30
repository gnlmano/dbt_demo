WITH payments AS(
    SELECT
        ORDERID order_id,
        STATUS,
        AMOUNT/100 amount,
        CREATED created
    FROM {{ source('stripe', 'payment') }}
)
SELECT * FROM payments