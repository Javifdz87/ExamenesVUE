CREATE TABLE users(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);
CREATE TABLE clients(
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    last_Name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone INT NOT NULL,
    town VARCHAR(255) NOT NULL,
    postal_code INT NOT NULL,
    province VARCHAR(255) NOT NULL,
    role VARCHAR(255) NOT NULL
);

CREATE TABLE polizas(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    import DOUBLE(8, 2) NOT NULL,
    start_date DATE NOT NULL,
    status VARCHAR(255) NOT NULL,
    observation TEXT NOT NULL,
    client_id INT NOT NULL,
    FOREIGN KEY(client_id) REFERENCES clients(id)
);


INSERT INTO clients (id, name, last_Name, email, phone, town, postal_code, province, role) VALUES
(1, 'Juan', 'García', 'juan@example.com', 123456789, 'Madrid', 28001, 'MAD', 'particular'),
(2, 'María', 'López', 'maria@example.com', 987654321, 'Barcelona', 08001, 'BCN', 'particular'),
(3, 'Empresa A', 'S.L.', 'empresaA@example.com', 555555555, 'Valencia', 46001, 'VAL', 'empresa'),
(4, 'Empresa B', 'S.A.', 'empresaB@example.com', 666666666, 'Sevilla', 41001, 'SEV', 'empresa'),
(5, 'Pedro', 'Martínez', 'pedro@example.com', 333333333, 'Alicante', 03001, 'ALC', 'particular'),
(6, 'Laura', 'González', 'laura@example.com', 444444444, 'Málaga', 29001, 'MAL', 'particular'),
(7, 'Antonio', 'Fernández', 'antonio@example.com', 555555555, 'Zaragoza', 50001, 'ZAR', 'particular'),
(8, 'Carmen', 'Ruiz', 'carmen@example.com', 666666666, 'Bilbao', 48001, 'BIO', 'particular'),
(9, 'Raul', 'Díaz', 'raul@example.com', 777777777, 'Murcia', 30001, 'MUR', 'particular'),
(10, 'Sandra', 'Martín', 'sandra@example.com', 888888888, 'Granada', 18001, 'GRA', 'particular'),
(11, 'David', 'Sánchez', 'david@example.com', 999999999, 'Córdoba', 14001, 'COR', 'particular'),
(12, 'Elena', 'Pérez', 'elena@example.com', 101010101, 'Valladolid', 47001, 'VAL', 'particular'),
(13, 'Javier', 'Gómez', 'javier@example.com', 111111111, 'A Coruña', 15001, 'COR', 'particular'),
(14, 'Ana', 'Hernández', 'ana@example.com', 121212121, 'Santander', 39001, 'SAN', 'particular'),
(15, 'Luis', 'Jiménez', 'luis@example.com', 131313131, 'Toledo', 45001, 'TOL', 'particular');


-- Póliza para Juan García
INSERT INTO polizas (import, start_date, status, observation, client_id) VALUES (150.00, '2024-02-25', 'cobrada', 'Póliza de seguro de hogar', 1);

-- Póliza para María López
INSERT INTO polizas (import, start_date, status, observation, client_id) VALUES (200.00, '2024-02-25', 'a cuenta', 'Póliza de seguro de automóvil', 2);

-- Póliza para Empresa A S.L.
INSERT INTO polizas (import, start_date, status, observation, client_id) VALUES (1000.00, '2024-02-25', 'liquidada', 'Póliza de seguro de responsabilidad civil', 3);

-- Póliza para Empresa B S.A.
INSERT INTO polizas (import, start_date, status, observation, client_id) VALUES (800.00, '2024-02-25', 'anulada', 'Póliza de seguro de flota de vehículos', 4);

-- Póliza para Pedro Martínez
INSERT INTO polizas (import, start_date, status, observation, client_id) VALUES (120.00, '2024-02-25', 'pre anulada', 'Póliza de seguro de salud', 5);

-- Póliza para Laura González
INSERT INTO polizas (import, start_date, status, observation, client_id) VALUES (180.00, '2024-02-25', 'a cuenta', 'Póliza de seguro de vida', 6);

-- Póliza para Antonio Fernández
INSERT INTO polizas (import, start_date, status, observation, client_id) VALUES (250.00, '2024-02-25', 'cobrada', 'Póliza de seguro de viaje', 7);



INSERT INTO users (name, email, password) VALUES
('admin', 'admin@gmail.com', '$2y$10$TvoY2hw0Exd4ZJyyLDoIDOM.CprXYMZ/1oyk32u8swNLfJBoe2DOu');
