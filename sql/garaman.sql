-- GaraMan: tao CSDL va du lieu mau cho 2 module demo
CREATE DATABASE IF NOT EXISTS garaman CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE garaman;

CREATE TABLE tblMember1 (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255), username VARCHAR(255), password VARCHAR(255),
	birth DATE, email VARCHAR(255), phoneNumber VARCHAR(255), role VARCHAR(255)
);
CREATE TABLE tblEmployee1 (
	tblMember1id INT PRIMARY KEY, position VARCHAR(255),
	FOREIGN KEY (tblMember1id) REFERENCES tblMember1(id)
);
CREATE TABLE tblService1 (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255), type VARCHAR(255), description VARCHAR(500),
	price FLOAT, duration INT, image VARCHAR(255), targetVehicle VARCHAR(255)
);
CREATE TABLE tblSparePart1 (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255), type VARCHAR(255), brand VARCHAR(255), origin VARCHAR(255),
	sellingPrice FLOAT, stock INT DEFAULT 0, image VARCHAR(255),
	description VARCHAR(500), warrantyPeriod INT
);
CREATE TABLE tblSparePartPerService1 (
	id INT AUTO_INCREMENT PRIMARY KEY, quantity INT,
	tblService1id INT, tblSparePart1id INT,
	FOREIGN KEY (tblService1id) REFERENCES tblService1(id),
	FOREIGN KEY (tblSparePart1id) REFERENCES tblSparePart1(id)
);
CREATE TABLE tblSupplier1 (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255), address VARCHAR(255), phoneNumber VARCHAR(255), email VARCHAR(255)
);
CREATE TABLE tblImportInvoice1 (
	id INT AUTO_INCREMENT PRIMARY KEY,
	createdDate DATETIME, paymentDate DATETIME, status VARCHAR(255), note VARCHAR(255),
	tblSupplier1id INT, tblEmployee1id INT,
	FOREIGN KEY (tblSupplier1id) REFERENCES tblSupplier1(id),
	FOREIGN KEY (tblEmployee1id) REFERENCES tblEmployee1(tblMember1id)
);
CREATE TABLE tblImportDetail1 (
	id INT AUTO_INCREMENT PRIMARY KEY, importPrice FLOAT, quantity INT,
	tblImportInvoice1id INT, tblSparePart1id INT,
	FOREIGN KEY (tblImportInvoice1id) REFERENCES tblImportInvoice1(id),
	FOREIGN KEY (tblSparePart1id) REFERENCES tblSparePart1(id)
);

-- Du lieu mau
INSERT INTO tblMember1(name, username, password, role) VALUES
('Nguyễn Văn An', 'kh01', '123', 'customer'),
('Trần Thị Bình', 'nvk01', '123', 'employee');
INSERT INTO tblEmployee1 VALUES (2, 'warehouse');

INSERT INTO tblService1(name, type, description, price, duration, targetVehicle) VALUES
('Bảo dưỡng phanh', 'Bảo dưỡng', 'Kiểm tra má phanh, đĩa phanh, dầu phanh; vệ sinh và điều chỉnh.', 300000, 90, 'Ô tô con Toyota, Honda'),
('Bảo dưỡng phanh xe tải', 'Bảo dưỡng', 'Bảo dưỡng hệ thống phanh cho xe tải.', 500000, 120, 'Ô tô tải Hyundai'),
('Bảo dưỡng điều hòa', 'Bảo dưỡng', 'Vệ sinh dàn lạnh, kiểm tra gas điều hòa.', 350000, 60, 'Ô tô con Honda');

INSERT INTO tblSparePart1(name, type, brand, origin, sellingPrice, stock, description, warrantyPeriod) VALUES
('Má phanh trước', 'Phanh', 'Toyota', 'Nhật Bản', 850000, 12, 'Má phanh đĩa, vật liệu ceramic.', 6),
('Dầu phanh DOT4', 'Dầu', 'Castrol', 'Anh', 150000, 30, 'Dầu phanh DOT4, 1 lít.', 0),
('Lọc dầu Toyota', 'Lọc', 'Toyota', 'Nhật Bản', 180000, 40, 'Lọc dầu động cơ chính hãng.', 3);

INSERT INTO tblSparePartPerService1(quantity, tblService1id, tblSparePart1id) VALUES
(1, 1, 1), (1, 1, 2);

INSERT INTO tblSupplier1(name, address, phoneNumber, email) VALUES
('Công ty TNHH Phụ tùng Ô tô ABC', 'Hà Đông, Hà Nội', '0912345678', 'abc@phutung.vn'),
('Công ty CP Phụ tùng Minh Phát', 'Giải Phóng, Hà Nội', '0987654321', 'minhphat@phutung.vn');
