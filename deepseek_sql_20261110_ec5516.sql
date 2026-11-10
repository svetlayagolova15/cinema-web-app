CREATE DATABASE IF NOT EXISTS cinema_db;
USE cinema_db;

CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES roles(id)
);

CREATE TABLE movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    duration INT NOT NULL
);

CREATE TABLE sessions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    start_time DATETIME,
    price DECIMAL(10,2),
    FOREIGN KEY (movie_id) REFERENCES movies(id)
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    session_id INT,
    status VARCHAR(50) DEFAULT 'new',
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (session_id) REFERENCES sessions(id)
);