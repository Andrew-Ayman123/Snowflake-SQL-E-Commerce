-- Inserting into User table
INSERT INTO Users
  (user_name, user_email, user_password, user_account_creation_date, birth_of_date)
VALUES
  ('John Doe', 'john.doe@example.com', 'password123', '2024-04-27 12:00:00', '1990-01-01'),
  ('Jane Smith', 'jane.smith@example.com', 'qwerty456', '2024-04-27 12:00:00', '1985-05-15'),
  ('Alice Johnson', 'alice.johnson@example.com', 'pass123', '2010-04-27 12:00:00', '1988-08-20'),
  ('Bob Brown', 'bob.brown@example.com', 'brownie', '2024-04-27 12:00:00', '1975-03-10'),
  ('Emily Davis', 'emily.davis@example.com', 'edavis', '2024-04-27 12:00:00', '1995-11-28');
-- Inserting into Supplier table
INSERT INTO Supplier
  (supplier_ssn, supplier_contract, user_email)
VALUES
  ('901-23-4567', 'Contract E', 'emily.davis@example.com');
-- Inserting into Admin table
INSERT INTO Admin
  (admin_role, user_email)
VALUES
  ('Products Admin', 'bob.brown@example.com');
-- Inserting into Customer table
INSERT INTO Customer
  (customer_gender, user_email,cart_id)
VALUES
  ('Male', 'john.doe@example.com', 1),
  ('Female', 'jane.smith@example.com', 2),
  ('Female', 'alice.johnson@example.com', 3);
-- Inserting into User_user_phone_number table
INSERT INTO User_user_phone_number
  (user_phone_number, user_email)
VALUES
  ('123-456-7890', 'john.doe@example.com'),
  ('321-456-0987', 'john.doe@example.com'),
  ('987-654-3210', 'jane.smith@example.com'),
  ('456-789-0123', 'alice.johnson@example.com'),
  ('789-012-3456', 'bob.brown@example.com'),
  ('234-567-8901', 'emily.davis@example.com');
-- Inserting into User_user_addresses table
INSERT INTO User_user_addresses
  (user_addresses, user_email)
VALUES
  ('1600 Pennsylvania Avenue NW', 'john.doe@example.com'),
  ('Rockefeller Plaza, 30 Rockefeller Plaza, New York', 'jane.smith@example.com'),
  ('400 S Hope St, Los Angeles', 'jane.smith@example.com'),
  ('233 S Wacker Dr, Chicago', 'alice.johnson@example.com'),
  ('500 E Cesar Chavez St, Austin', 'bob.brown@example.com'),
  ('101 Montgomery St, San Francisco', 'emily.davis@example.com');
-- Inserting into Product table
INSERT INTO Product
  (product_price_per_unit, product_quantity, product_brand, product_name, product_id, product_description, inventory_ID, user_email)
VALUES
  (10, 100, 'Brand A', 'Product 1', 1, 'Description for Product 1', 1, 'emily.davis@example.com'),
  (20, 200, 'Toxic Brand', 'Product 2', 2, 'Description for Product 2', 2, 'emily.davis@example.com'),
  (15, 150, 'Brand C', 'Product 3', 3, 'Description for Product 3', 3, 'emily.davis@example.com'),
  (25, 250, 'Brand D', 'Product 4', 4, 'Description for Product 4', 4, 'emily.davis@example.com'),
  (30, 300, 'Brand E', 'Product 5', 5, 'Description for Product 5', 5, 'emily.davis@example.com');
-- Inserting into carry_ table
INSERT INTO carry
  (product_id, user_email,no_of_product)
VALUES
  (1, 'john.doe@example.com', 1),
  (2, 'john.doe@example.com', 1),
  (3, 'john.doe@example.com', 2),
  (4, 'jane.smith@example.com', 1),
  (5, 'jane.smith@example.com', 1);