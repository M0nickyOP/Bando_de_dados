-- CREATE DATABASE IF NOT EXISTS BD_DINHEIRAMA;

-- USE BD_DINHEIRAMA;

CREATE TABLE USUARIOS (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  senha VARCHAR(255) NOT NULL,
  data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE CONTAS(
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT NOT NULL,
  nome VARCHAR(100) NOT NULL,
  saldo_inicial DECIMAL(10,2) DEFAULT 0.00,
  tipo ENUM('corrente', 'poupança','investimento','dinheiro')
  DEFAULT 'corrente',
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
  ON DELETE CASCADE
);

CREATE TABLE CATEGORIAS(
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT NOT NULL,
  nome VARCHAR(100) NOT NULL,
  tipo ENUM('receita', 'despesa') NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
  ON DELETE CASCADE
);

CREATE TABLE TRANSACOES(
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT NOT NULL,
  conta_id INT NOT NULL,
  categoria_id INT NOT NULL,
  tipo ENUM('receita','despesa') NOT NULL,
  descricao VARCHAR(255),
  valor DECIMAL(10,2) NOT NULL,
  data_transacao DATE NOT NULL,
  data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
  FOREIGN KEY (conta_id) REFERENCES contaS(id) ON DELETE CASCADE,
  FOREIGN KEY (categoria_id) REFERENCES categorias(id) ON DELETE CASCADE
);

SHOW TABLES;

DESCRIBE CONTAS;

-- =============================
-- POVOAMENTO DAS TABELAS
-- =============================

-- USUÁRIOS
INSERT INTO usuarios (nome, email, senha) VALUES
('Daniel Costa', 'daniel.costa@email.com', SHA2('senha123', 256)),
('Maria Barbosa', 'maria.barbosa@email.com', SHA2('cozinha@123', 256)),
('Lucas Andrade', 'lucas.andrade@email.com', SHA2('123456', 256));
a
-- CONTAS
INSERT INTO contas (usuario_id, nome, saldo_inicial, tipo) VALUES
(1, 'Conta Corrente - Nubank', 2500.00, 'corrente'),
(1, 'Poupança - Caixa', 5000.00, 'poupança'),
(2, 'Conta Corrente - Bradesco', 3200.00, 'corrente'),
(2, 'Dinheiro em Caixa', 800.00, 'dinheiro'),
(3, 'Investimentos - XP', 15000.00, 'investimento'),
(3, 'Conta Corrente - Inter', 1800.00, 'corrente');

-- CATEGORIAS
INSERT INTO categorias (usuario_id, nome, tipo) VALUES
(1, 'Salário', 'receita'),
(1, 'Alimentação', 'despesa'),
(1, 'Transporte', 'despesa'),
(2, 'Vendas', 'receita'),
(2, 'Matéria-prima', 'despesa'),
(2, 'Marketing', 'despesa'),
(3, 'Dividendos', 'receita'),
(3, 'Educação', 'despesa'),
(3, 'Lazer', 'despesa');

-- TRANSACOES
INSERT INTO transacoes (usuario_id, conta_id, categoria_id, tipo, descricao, valor, data_transacao) VALUES
-- Usuário 1 (Daniel)
(1, 1, 1, 'receita', 'Salário mensal', 3500.00, '2025-11-01'),
(1, 1, 2, 'despesa', 'Almoço no restaurante', 45.50, '2025-11-02'),
(1, 2, 3, 'despesa', 'Uber para o trabalho', 25.00, '2025-11-03'),

-- Usuário 2 (Maria)
(2, 3, 4, 'receita', 'Venda de marmitas', 1200.00, '2025-11-01'),
(2, 4, 5, 'despesa', 'Compra de insumos', 400.00, '2025-11-02'),
(2, 3, 6, 'despesa', 'Campanha no Instagram', 150.00, '2025-11-03'),

-- Usuário 3 (Lucas)
(3, 5, 7, 'receita', 'Dividendos de ações', 300.00, '2025-11-01'),
(3, 6, 8, 'despesa', 'Curso de IA online', 250.00, '2025-11-02'),
(3, 6, 9, 'despesa', 'Cinema com amigos', 60.00, '2025-11-03');

SELECT 
id AS codigo_usuario,
nome AS nome_completo, 
email AS email_principal,
data_cadastro AS criado_em, 
FROM USUARIOS,
ORDER BY nome DESC, 

SELECT 
u.id AS usuario_id,
u.nome AS nome_usuario,
c.id AS conta_id, 
c.nome AS nome_conta, 
