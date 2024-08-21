use digital_jsp;

CREATE TABLE IF NOT EXISTS customer(
	id INT PRIMARY KEY AUTO_INCREMENT,		
	name VARCHAR(100),					
	email VARCHAR(100) UNIQUE,				
	number VARCHAR(15),								
	join_date TIMESTAMP default now()		
);

CREATE TABLE IF NOT EXISTS product(
	product_id INT PRIMARY KEY AUTO_INCREMENT,		
	product_name VARCHAR(100),					
	explains VARCHAR(500),				
	price INT,								
	stock INT		
);

CREATE TABLE IF NOT EXISTS `order`(
	order_id INT UNIQUE AUTO_INCREMENT,		
	id INT,
	order_date TIMESTAMP default now(),
	order_status VARCHAR(50),
    FOREIGN KEY (id) REFERENCES customer(id)
		ON DELETE CASCADE
        ON UPDATE CASCADE							
);

CREATE TABLE IF NOT EXISTS order_details(
	detail_id INT UNIQUE AUTO_INCREMENT,		
	order_id INT,
	product_id INT,
	amount INT,
	cost INT,
    FOREIGN KEY (order_id) REFERENCES `order`(order_id)
		ON DELETE CASCADE
        ON UPDATE CASCADE,			
    FOREIGN KEY (product_id) REFERENCES product(product_id)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);


