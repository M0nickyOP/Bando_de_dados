// CREATE database IF NOT EXISTS BD_DINHEIRAMA;
// USE BD_DINHEIRAMA
CREATE TABLE usuarios(
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  senha VARCHAR(255) NOT NULL,
  data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

CREATE TABLE CONTAS (
id INT AUTO_INCREMENT PRIMARY KEY,
usuario_id INT NOT NULL,
nome varchar(100) NOT NULL, 
saldo_inicial DECIMAL (10,2) default 0.00,
tipo ENUM('corrente', 'poupanca','investimento', 'dinheiro') DEFAULT 'corrente',
FOREIGN KEY (usuario_id) references usuarios(id) ON DELETE CASCADE
);

CREATE TABLE CATEGORIAS(
id INT AUTO_INCREMENT PRIMARY KEY,
usuario_id INT NOT NULL,
categoria_id INT NOT NULL,
nome VARCHAR (100) NOT NULL, 
tipo ENUM ('receita', 'despesa') NOT NULL,
FOREIGN KEY (usuario_id) references usuarios(id)
ON DELETE CASCADE
);

CREATE TABLE TRANSACOES(
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT NOT NULL,
  conta_id INT NOT NULL,
  categoria_id INT NOT NULL,
  tipo ENUM ('receita','despesa') NOT NULL,
  descricao VARCHAR(255),
  valor DECIMAL(10,2)  NOT NULL,
  data_transacao DATE NOT NULL,
  data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(usuario_id) REFERENCES usuarios(id)  ON DELETE CASCADE, 
  FOREIGN KEY(conta_id) REFERENCES contas(id)  ON DELETE CASCADE,
  FOREIGN KEY (categoria_id) REFERENCES categorias(id) ON DELETE CASCADE 
)
CREATE TABLE CALOTEIROS {
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id NOT NULL,
    nome_VARCHAR(100),
    telefone VARCHAR(100),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
}
DESCRIBE CALOTEIROS;

ALTER TABLE CALOTEIROS ADD 
saldo_devedor DECIMAL (10,2)

DESCRIBE CALOTEIROS;

SHOW TABLES;
DROP TABLE CALOTEIROS;
SHOW TABLES;
}
