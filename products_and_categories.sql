CREATE TABLE products
(
    id SERIAL PRIMARY KEY,
    name VARCHAR
);

CREATE TABLE categoties
(
    id SERIAL PRIMARY KEY,
    name VARCHAR
);

CREATE TABLE products_categoties_references
(
    id BIGSERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL REFERENCES products,
    categoty_id   INTEGER NOT NULL REFERENCES categoties
);



INSERT INTO products
VALUES (1, 'IPhone'),
	   (2, 'MacBook'),
	   (3, 'GooglePixel'),
	   (4, 'Oscilloscope');


INSERT INTO categoties
VALUES (1, 'SmartPhone'),
	   (2, 'Laptop'),
	   (3, 'Apple');


INSERT INTO products_categoties_references
VALUES (1, 1, 1),
	   (2, 1, 3),
	   (3, 2, 3),
	   (4, 2, 2),
	   (5, 3, 1);



SELECT P.name, C.name FROM products p
LEFT JOIN products_categoties_references pcr ON p.id = pcr.product_id
LEFT JOIN categoties c ON pcr.categoty_id = c.id;