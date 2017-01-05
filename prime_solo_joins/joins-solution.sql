--Get all customers and their addresses.
SELECT *
FROM addresses
INNER JOIN customers
ON addresses.customer_id=customers.id;
--Get all orders and their line items.
SELECT *
FROM orders
INNER JOIN line_items
ON line_items.order_id=orders.id;
--Which warehouses have cheetos?
SELECT warehouse.id, warehouse.warehouse FROM warehouse
JOIN warehouse_product ON warehouse.id=warehouse_product.warehouse_id
JOIN products on warehouse_product.product_id=products.id
WHERE products.description='cheetos';
--Which warehouses have diet pepsi?
SELECT warehouse.id, warehouse.warehouse FROM warehouse
JOIN warehouse_product ON warehouse.id=warehouse_product.warehouse_id
JOIN products on warehouse_product.product_id=products.id
WHERE products.description='diet pepsi';
--Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT customers.id, customers.first_name, customers.last_name, count(orders.id) FROM customers
JOIN addresses ON customers.id=addresses.customer_id
JOIN orders ON addresses.id=orders.address_id
GROUP BY customers.id;
--How many customers do we have?
SELECT count(id) FROM customers;
--How many products do we carry?
SELECT count(id) FROM products;
--What is the total available on-hand quantity of diet pepsi?
SELECT sum(on_hand) FROM warehouse_product
JOIN products ON warehouse_product.product_id=products.id
WHERE products.description='diet pepsi';
