CREATE TABLE Users (
    userid INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    fullname VARCHAR(100),
    roleid INT NOT NULL
);

CREATE TABLE Category (
    categoryid INT PRIMARY KEY AUTO_INCREMENT,
    categoryname VARCHAR(100) NOT NULL,
    description TEXT,
    userid INT,
    FOREIGN KEY (userid) REFERENCES Users(userid) ON DELETE CASCADE
);

INSERT INTO Users (username, password, fullname, roleid) VALUES
('user1', '123456', 'Nguyen Van A', 1),
('user2', '123456', 'Tran Van B', 1),
('manager1', '123456', 'Le Thi C', 2),
('manager2', '123456', 'Pham Van D', 2),
('admin1', '123456', 'Hoang Thi E', 3);

INSERT INTO Category (categoryname, description, userid) VALUES
('Electronics', 'Electronic devices and gadgets', 1),
('Mobile Phones', 'Smartphones and accessories', 1),
('Laptops', 'Laptop computers', 1),
('Books', 'Books and publications', 2),
('Novels', 'Fiction novels', 2),
('Clothing', 'Fashion and apparel', 3),
('Men Fashion', 'Men clothing', 3),
('Women Fashion', 'Women clothing', 3),
('Food & Beverage', 'Food products', 4),
('Snacks', 'Snack foods', 4),
('Home & Garden', 'Home improvement', 5),
('Furniture', 'Home furniture', 5);