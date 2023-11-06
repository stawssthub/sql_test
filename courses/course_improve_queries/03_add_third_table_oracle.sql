/*
Lesson 03
Oracle
*/

CREATE TABLE sales_order (
  id NUMBER(20),
  person_id NUMBER(20),
  order_date DATE,
  order_value NUMBER(6),
  CONSTRAINT pk_salesorder PRIMARY KEY (id),
  CONSTRAINT fk_salesorder_per FOREIGN KEY (person_id)
  REFERENCES person(person_id)  
);

INSERT INTO sales_order (id, person_id, order_date, order_value)
VALUES (1, 2, DATE '2020-12-05', 120);
INSERT INTO sales_order (id, person_id, order_date, order_value)
VALUES (2, 5, DATE '2020-12-07', 82);
INSERT INTO sales_order (id, person_id, order_date, order_value)
VALUES (3, 10, DATE '2020-12-08', 165);
INSERT INTO sales_order (id, person_id, order_date, order_value)
VALUES (4, 8, DATE '2020-12-12', 239);
INSERT INTO sales_order (id, person_id, order_date, order_value)
VALUES (5, 6, DATE '2020-12-15', 54);


SELECT
id,
person_id,
order_date,
order_value
FROM sales_order;