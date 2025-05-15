use olist_store_project;

select
	case when dayofweek(str_to_date(o.order_purchase_timestamp, '%y-%m-%d'))
IN (1, 8) then 'weekend' else 'weekday' end as Daytype,
count(Distinct o.order_id) as Totalorders,
round(sum(p.payment_value)) as TotalPayments,
round(Avg(p.payment_value)) as averegepayment
from
	olist_orders_dataset o
    join 
    olist_order_payments_dataset p on o.order_id = p.order_id
    group by
		daytype;
        
        select count(o.order_id) as numberoforders,p.payment_type
        from olist_orders_dataset o
        join olist_order_payments_dataset p on o.order_id = p.order_id
        group by p.payment_type;
        
        select seller_state,count(seller_id) as numberofsellers
        from olist_sellers_dataset
        group by seller_state
        order by seller_state desc
        limit 10;
        
        select customer_state,count(customer_id) as numberofcustomers
        from olist_customers_dataset
        group by customer_state
        order by customer_state desc
        limit 10;
        
        select product_id.p,payment_value.pm
        from olist_products_dataset
        join olist_order_payments_dataset on p.product_id = pm.order_id
        order by product_id desc
        limit 10;