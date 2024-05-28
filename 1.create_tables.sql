CREATE TABLE Users
(
  user_name VARCHAR NOT NULL,
  user_email VARCHAR NOT NULL,
  user_password VARCHAR NOT NULL,
  user_account_creation_date DATETIME NOT NULL,
  birth_of_date DATE,
  PRIMARY KEY (user_email)
);
CREATE TABLE Inventory
(
  inventory_ID INT NOT NULL,
  inventory_address VARCHAR NOT NULL,
  PRIMARY KEY (inventory_ID)
);
CREATE TABLE Supplier
(
  supplier_ssn VARCHAR NOT NULL,
  supplier_contract VARCHAR NOT NULL,
  user_email VARCHAR NOT NULL,
  PRIMARY KEY (user_email),
  FOREIGN KEY (user_email) REFERENCES Users(user_email)
);
CREATE TABLE Admin
(
  admin_role VARCHAR NOT NULL,
  user_email VARCHAR NOT NULL,
  PRIMARY KEY (user_email),
  FOREIGN KEY (user_email) REFERENCES Users(user_email)
);
CREATE TABLE Customer
(
  customer_gender VARCHAR NOT NULL,
  user_email VARCHAR NOT NULL,
  PRIMARY KEY (user_email),
  FOREIGN KEY (user_email) REFERENCES Users(user_email)
);
CREATE TABLE Shipper
(
  shipper_id INT NOT NULL,
  shipper_name VARCHAR NOT NULL,
  shipper_phone_number VARCHAR NOT NULL,
  PRIMARY KEY (shipper_id)
);
CREATE TABLE Manages
(
  user_email VARCHAR NOT NULL,
  inventory_ID INT NOT NULL,
  PRIMARY KEY (user_email, inventory_ID),
  FOREIGN KEY (user_email) REFERENCES Admin(user_email),
  FOREIGN KEY (inventory_ID) REFERENCES Inventory_(inventory_ID)
);
CREATE TABLE Deliver
(
  shipper_id INT NOT NULL,
  user_email VARCHAR NOT NULL,
  PRIMARY KEY (shipper_id, user_email),
  FOREIGN KEY (shipper_id) REFERENCES Shipper(shipper_id),
  FOREIGN KEY (user_email) REFERENCES Customer(user_email)
);
CREATE TABLE Users_user_phone_number
(
  user_phone_number VARCHAR NOT NULL,
  user_email VARCHAR NOT NULL,
  PRIMARY KEY (user_phone_number, user_email),
  FOREIGN KEY (user_email) REFERENCES Users(user_email)
);
CREATE TABLE Users_user_addresses
(
  user_addresses VARCHAR NOT NULL,
  user_email VARCHAR NOT NULL,
  PRIMARY KEY (user_addresses, user_email),
  FOREIGN KEY (user_email) REFERENCES Users(user_email)
);
CREATE TABLE Product
(
  product_price_per_unit INT NOT NULL,
  product_quantity INT NOT NULL,
  product_brand VARCHAR NOT NULL,
  product_name VARCHAR NOT NULL,
  product_id INT NOT NULL,
  product_description VARCHAR NOT NULL,
  inventory_ID INT NOT NULL,
  user_email VARCHAR NOT NULL,
  PRIMARY KEY (product_id),
  FOREIGN KEY (inventory_ID) REFERENCES Inventory_(inventory_ID),
  FOREIGN KEY (user_email) REFERENCES Supplier(user_email)
);
CREATE TABLE Payment_Method
(
  payment_id INT NOT NULL,
  payment_account_number VARCHAR NOT NULL,
  payment_type VARCHAR NOT NULL,
  user_email VARCHAR NOT NULL,
  PRIMARY KEY (payment_id),
  FOREIGN KEY (user_email) REFERENCES Customer(user_email)
);
CREATE TABLE Orders
(
  order_id INT NOT NULL,
  order_date DATE NOT NULL,
  order_addres VARCHAR NOT NULL,
  order_status VARCHAR NOT NULL,
  order_amount INT NOT NULL,
  payment_id INT NOT NULL,
  user_email VARCHAR NOT NULL,
  shipper_id INT NOT NULL,
  PRIMARY KEY (order_id),
  FOREIGN KEY (payment_id) REFERENCES Payment_Method(payment_id),
  FOREIGN KEY (user_email) REFERENCES Customer(user_email),
  FOREIGN KEY (shipper_id) REFERENCES Shipper(shipper_id)
);
CREATE TABLE Category
(
  category_id INT NOT NULL,
  category_name VARCHAR NOT NULL,
  category_description VARCHAR NOT NULL,
  user_email VARCHAR NOT NULL,
  PRIMARY KEY (category_id),
  FOREIGN KEY (user_email) REFERENCES Admin(user_email)
);
CREATE TABLE Belongs_to
(
  product_id INT NOT NULL,
  category_id INT NOT NULL,
  PRIMARY KEY (product_id, category_id),
  FOREIGN KEY (product_id) REFERENCES Product(product_id),
  FOREIGN KEY (category_id) REFERENCES Category(category_id)
);
CREATE TABLE ContainsTa
(
  product_id INT NOT NULL,
  order_id INT NOT NULL,
  PRIMARY KEY (product_id, order_id),
  FOREIGN KEY (product_id) REFERENCES Product(product_id),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
CREATE TABLE carry
(
  product_id INT NOT NULL,
  user_email VARCHAR NOT NULL,
  PRIMARY KEY (product_id, user_email),
  FOREIGN KEY (product_id) REFERENCES Product(product_id),
  FOREIGN KEY (user_email) REFERENCES Customer(user_email)
);
CREATE TABLE Product_product_colors
(
  product_colors VARCHAR NOT NULL,
  product_id INT NOT NULL,
  PRIMARY KEY (product_colors, product_id),
  FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
CREATE TABLE Product_product_images
(
  product_images VARCHAR NOT NULL,
  product_id INT NOT NULL,
  PRIMARY KEY (product_images, product_id),
  FOREIGN KEY (product_id) REFERENCES Product(product_id)
);