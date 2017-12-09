-- -----------------------------------------------------------------
-- Description: This is the file to insert data into the my_store database.
--
-- Author:		Asvestopoulos Theodosis
-- -----------------------------------------------------------------

-- Insert some addresses for the vendors
INSERT INTO addresses (address, zip_code, country) VALUES ('Applefield 450', 12555, 'England');
INSERT INTO addresses (address, zip_code, country) VALUES ('Müllheimerweg 660', 66553, 'Germany');
INSERT INTO addresses (address, zip_code, country) VALUES ('Longroad 4560', 88667, 'Ireland');
INSERT INTO addresses (address, zip_code, country) VALUES ('Leoforos Kifisias 12', 44457, 'Greece');
INSERT INTO addresses (address, zip_code, country) VALUES ('Kreutzstrasse 58', 22239, 'Germany');

-- Insert some contact details for the vendors
INSERT INTO contact_details (phone1, email1) VALUES ('2235878545', 'sales@adams.com');
INSERT INTO contact_details (phone1, email1) VALUES ('5688977845', 'promotions@jonathan.com');
INSERT INTO contact_details (phone1, email1) VALUES ('2566587454', 'johanes@gmail.com');
INSERT INTO contact_details (phone1, email1) VALUES ('2355642257', 'alexios@otenet.gr');
INSERT INTO contact_details (phone1, email1) VALUES ('5545781245', 'electronet@tonline.de');

-- Insert some vendors
INSERT INTO vendors (vendor_name, description, contact_id, address_id) VALUES ('Adams Brothers', 'Apple products, like iPhone or iMac.', 1, 1);
INSERT INTO vendors (vendor_name, description, contact_id, address_id) VALUES ('Jonathan LTD', 'Laptops and Android powered smartphones.', 2, 3);
INSERT INTO vendors (vendor_name, description, contact_id, address_id) VALUES ('Johanes der Beste', 'Tablets and Android phones with the best quality.', 3, 2);
INSERT INTO vendors (vendor_name, description, contact_id, address_id) VALUES ('Alexios kai sia', 'Books and literature', 4, 4);
INSERT INTO vendors (vendor_name, description, contact_id, address_id) VALUES ('Electronet', 'All kindds of electronic devices', 5, 5);

-- Insert some product categories
INSERT INTO product_categories (category_name, description) VALUES ('Mobile phones', 'Mostly smartphones with an Android OS and some iPhones too.');
INSERT INTO product_categories (category_name, description) VALUES ('Laptops', 'Some of the newest laptops in the market from vendors like HP and DELL');
INSERT INTO product_categories (category_name, description) VALUES ('Tablets', 'Nice and easy tablets to be on the game 24-7');
INSERT INTO product_categories (category_name, description) VALUES ('Books', 'For those interested on mystery and adventure stories, as well as classic literature.');

-- Insert some products
INSERT INTO products (product_name, price, category_id) VALUES ('MacBook Pro 13" Touch Bar Intel Core i5-7267U/8 GB/512 GB/Iris Plus Graphics 650 Silver',2279.00,2);
INSERT INTO products (product_name, price, category_id) VALUES ('MacBook Pro 15" Touch Bar Intel Core i7-7700HQ/16 GB/512 GB/Radeon Pro 560 4GB Silver',3619.00,2);
INSERT INTO products (product_name, price, category_id) VALUES ('HP 15-BS029NV Intel Core i3-6006U/4GB/256 GB SSD/Full HD',559.00,2);
INSERT INTO products (product_name, price, category_id) VALUES ('HP 15-AY101NV Intel Core i5-7200U/6GB/256GB/Radeon R5 M430 2GB/Full HD',649.00,2);
INSERT INTO products (product_name, price, category_id) VALUES ('Xiaomi Redmi Note 4X (Snapdragon) (32GB)',161.82,1);
INSERT INTO products (product_name, price, category_id) VALUES ('Samsung Galaxy S7 Edge (32GB)',453.80,1);
INSERT INTO products (product_name, price, category_id) VALUES ('Samsung Galaxy S8+ (64GB)',667.92,1);
INSERT INTO products (product_name, price, category_id) VALUES ('TABLET LENOVO MIIX 300 10.1" QUAD CORE Z3735F 32GB WIFI BT WINDOWS 10 + KEYBOARD',229.00,3);
INSERT INTO products (product_name, price, category_id) VALUES ('TABLET APPLE IPAD PRO 2017 12.9" RETINA TOUCH ID 512GB WI-FI 4G GOLD',149.00,3);
INSERT INTO products (product_name, price, category_id) VALUES ('The man in the woods',14.30,4);
INSERT INTO products (product_name, price, category_id) VALUES ('Me and sparky',10.50,4);

-- Insert some product vendor pairs
INSERT INTO products_vendors (product_id,vendor_id) VALUES (1,1),(2,1),(3,2),(4,2),(5,2),(6,2),(6,3),(7,3),(8,5),(9,5),(10,4);