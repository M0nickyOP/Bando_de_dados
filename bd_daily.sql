-- CREATE database if not EXISTS BD_DAILY
-- USE BD_DAILY
CREATE TABLE Pessoas (
  id INT AUTO_INCREMENT PRIMARY KEY, 
  nome VARCHAR(100) NOT NULL, 
  idade INT  NOT NULL, 
  parentesco VARCHAR (100) NOT NULL
);

CREATE TABLE Tarefas (
  id_tarefas INT AUTO_INCREMENT PRIMARY KEY,
  id_pessoa INT  NOT NULL, 
  descricao TEXT (255),
  data_execucao DATE NOT NULL,
  FOREIGN KEY(id_pessoa) references Pessoas(id) 
);

-- Pessoas

INSERT INTO Pessoas ( nome, idade, parentesco) VALUES 
('Maria das Dores', 44, 'mae'),
('Josue Mendonça', 72, 'avô'),
(  'Guilherme Mendonça', 25, 'filho');

INSERT INTO tarefas ( id_pessoa, descricao, data_execucao) VALUES
( 1, 'dar banho no cachorro', '2021-04-05'),
(2,'lavar a louça', '2021-04-06'),
( 2,'consertar o ar condicionado', '2021-04-23'),
( 3,'varrer a casa', '2021-04-05'),
( 1,'colocar roupa no varal', '2021-04-09');

SELECT * FROM Pessoas;
SELECT * FROM tarefas; 

SELECT t.id_pessoa, p.nome, t.descricao
  FROM Tarefas t
  JOIN Pessoas p on t.id_pessoa = p.id;
  
  SELECT * FROM tarefas WHERE data_execucao ='2021-04-02'
  
