WITH payments AS(
    SELECT
        ORDERID order_id,
        STATUS,
        AMOUNT/100 amount,
        CREATED created
    FROM raw.stripe.payment
)
SELECT * FROM payments