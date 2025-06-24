-- Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS controle_gastos;
USE controle_gastos;

-- Tabela de Usuários
CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Categorias
CREATE TABLE categories (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL
);

-- Tabela de Lançamentos (Entradas e Saídas)
CREATE TABLE transactions (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  category_id INT,
  type ENUM('entrada', 'saida') NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  description VARCHAR(255),
  transaction_date DATETIME NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

  -- Definindo as Chaves Estrangeiras
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Inserindo Categorias Padrão
INSERT INTO categories (name) VALUES
('Alimentação'),
('Transporte'),
('Lazer'),
('Saúde'),
('Educação'),
('Outros');
