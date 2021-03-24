with payments as (
    select * from {{ ref('stg_payments') }}
),

revenue as (

    select
        count(*) as num_payments,
        sum(amount) as total_revenue

    from payments
    where
        status = 'success'

)

select * from revenue
