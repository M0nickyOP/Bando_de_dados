Create database if not exists BD_PETMANIA
 USE BD_PETMANIA
CREATE TABLE clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  telefone VARCHAR(15) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE pets(
  id_pet INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT NOT NULL,
  nome VARCHAR(100) NOT NULL,
  especie VARCHAR(100) NOT NULL, 
  cor VARCHAR(100) NOT NULL,
  idade INT NOT NULL,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);
CREATE TABLE servicos(
  id_servico INT AUTO_INCREMENT PRIMARY KEY,
  serv_pet_id INT NOT NULL,
  tipo VARCHAR(100) NOT NULL,
  preco DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (serv_pet_id) REFERENCES pets(id_pet)
);
CREATE TABLE agendamentos(
  id_agendamento INT AUTO_INCREMENT PRIMARY KEY,
  pet_id INT NOT NULL,
  servico_id INT NOT NULL,
  data_agend DATE NOT NULL,
  FOREIGN KEY (pet_id) REFERENCES pets(id_pet),
  FOREIGN KEY (servico_id) REFERENCES servicos(id_servico)
  );
  INSERT INTO clientes (nome,telefone,email) VALUES
  ('Cleber',92771122,'cleber@email.com'),
  ('Aguiar', 91832199,'resenhadornoturno@email.com'),
  ('Jeremias', 92812882, 'jeremias@email.com');
   
  INSERT INTO pets(cliente_id, nome, especie, cor, idade) VALUES
   (1,'lulu', 'cachorro', 'preto', 2),
   (2,'henri', 'cachorro', 'marrom', 10),
   (3,'pomba', 'calopsita','amarelo',1),
   (3, 'serafim vermelho', 'gato', 'rajado',4);
   
  INSERT INTO servicos(serv_pet_id,tipo, preco) VALUES
  (1,'consulta', 200.00),
  (2,'banho',50.00),
  (3,'tosa',20.00);
 
  
  INSERT INTO agendamentos(pet_id, servico_id,data_agend) VALUES
  (3,1,'2025-07-19'),
  (2,2,'2025-07-25'),
  (1,3, '2025-08-01');
  
  ALTER TABLE clientes ADD endereco VARCHAR(100);
  
  UPDATE clientes
  SET endereco = 'Avenida Principal, 344'
  WHERE nome = 'Cleber';
  
ALTER TABLE agendamentos ADD status VARCHAR(20);

UPDATE agendamentos
SET status = 'concluido'
WHERE data_agend = '2025-08-01';
  
  SELECT * FROM pets;
  SELECT * FROM clientes;
 
  
  SELECT p.id_pet, p.nome as nome_pet, a.data_agend
  FROM pets p 
  JOIN clientes c ON p.cliente_id = c.id
  JOIN agendamentos a ON p.id_pet = a.pet_id;
  
  SELECT nome, telefone 
  FROM clientes;
  
  SELECT p.nome as nome_pet, s.tipo as servico_pet, s.preco as preco_servico
  FROM pets p 
  JOIN servicos s ON s.serv_pet_id = p.id_pet;

 SELECT cliente_id,nome, especie 
  FROM pets
  WHERE cliente_id = 3;
