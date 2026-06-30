CREATE DATABASE IF NOT EXISTS carregis;
USE carregis;

-- ------------------------------------------------------------
-- Tabela: Pessoa
-- Representa qualquer entidade humana no sistema
-- (usuário, cliente, colaborador, participante, etc.)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS pessoa (
    id_pessoa              INT AUTO_INCREMENT PRIMARY KEY,
    nome            VARCHAR(100) NOT NULL,
    email           VARCHAR(150) UNIQUE,
    data_nascimento DATE,
    telefone        VARCHAR(20),
    status_pessoa          VARCHAR(20) DEFAULT 'ativo'
);

-- ------------------------------------------------------------
-- Tabela: Item
-- Representa qualquer recurso, produto ou elemento do sistema
-- (produto, livro, equipamento, serviço, vaga, etc.)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS item (
    id_item                    INT AUTO_INCREMENT PRIMARY KEY,
    nome                  VARCHAR(100) NOT NULL,
    categoria             VARCHAR(50),
    descricao             TEXT,
    valor                 DECIMAL(10, 2),
    quantidade_disponivel INT DEFAULT 0
);

-- ------------------------------------------------------------
-- Tabela: Registro
-- Representa uma relação entre Pessoa e Item
-- (compra, empréstimo, inscrição, reserva, etc.)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS registro (
    id_registro           INT AUTO_INCREMENT PRIMARY KEY,
    id_pessoa    INT NOT NULL,
    id_item      INT NOT NULL,
    data_registro DATE DEFAULT NULL,
    observacao   TEXT,
    status_registro       VARCHAR(20) DEFAULT 'pendente',
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa),
    FOREIGN KEY (id_item)   REFERENCES item(id_item)
);

-- ------------------------------------------------------------
-- Dados
-- Quais outros dados poderiam fazer parte do seu banco?
-- ------------------------------------------------------------

INSERT INTO pessoa (nome, email, data_nascimento, telefone, status_pessoa) VALUES
('Carlos Eduardo Silva', 'carlos.silva@email.com', '1982-04-15', '(11) 98765-4321', 'ativo'),
('Mariana Lopes Ferreira', 'mariana.ferreira@email.com', '1990-09-22', '(21) 97654-3210', 'ativo'),
('Rafael Augusto Pereira', 'rafael.pereira@email.com', '1978-12-03', '(31) 96543-2109', 'inativo'),
('Ana Paula Rodrigues', 'ana.rodrigues@email.com', '1985-06-30', '(41) 95432-1098', 'ativo'),
('Bruno Henrique Costa', 'bruno.costa@email.com', '1998-01-18', '(51) 94321-0987', 'ativo'),
('Fernanda Almeida Souza', 'fernanda.souza@email.com', '1976-11-09', '(61) 93210-9876', 'inativo'),
('Lucas Matheus Nogueira', 'lucas.nogueira@email.com', '2002-03-27', '(71) 92109-8765', 'ativo'),
('Patrícia Gomes Ribeiro', 'patricia.ribeiro@email.com', '1989-08-14', '(81) 91098-7654', 'ativo'),
('Diego Farias Monteiro', 'diego.monteiro@email.com', '1995-05-06', '(91) 99987-6543', 'ativo'),
('Juliana Teixeira Martins', 'juliana.martins@email.com', '1981-02-24', '(11) 98876-5432', 'inativo');



INSERT INTO item (nome, categoria, descricao, valor, quantidade_disponivel) VALUES
('Troca de Óleo', 'Serviço', 'Troca de óleo do motor', 150.00, 0),
('Filtro de Óleo', 'Peça', 'Filtro de óleo do motor', 45.90, 20),
('Alinhamento', 'Serviço', 'Alinhamento de rodas', 120.00, 0),
('Balanceamento', 'Serviço', 'Balanceamento de rodas', 100.00, 0),
('Pastilha de Freio', 'Peça', 'Pastilha de freio dianteira', 180.00, 15),
('Bateria 60Ah', 'Peça', 'Bateria automotiva 60Ah', 480.00, 8),
('Revisão Completa', 'Serviço', 'Revisão geral do veículo', 600.00, 0),
('Correia Dentada', 'Peça', 'Correia dentada do motor', 220.00, 10),
('Amortecedor', 'Peça', 'Amortecedor dianteiro', 350.00, 6),
('Diagnóstico Eletrônico', 'Serviço', 'Leitura de falhas via scanner', 90.00, 0);



INSERT INTO registro (id_pessoa, id_item, data_registro, observacao, status_registro) VALUES
(1, 1, '2024-03-10', 'Troca realizada com sucesso', 'concluido'),
(2, 3, '2024-03-12', 'Veículo puxando para a direita', 'concluido'),
(3, 5, '2024-03-15', 'Pastilhas desgastadas', 'concluido'),
(4, 7, '2024-03-18', 'Revisão preventiva', 'pendente'),
(5, 2, '2024-03-20', 'Substituição de filtro', 'concluido'),
(6, 6, '2024-03-22', 'Bateria descarregada', 'concluido'),
(7, 10, '2024-03-25', 'Luz de injeção acesa', 'pendente'),
(8, 4, '2024-03-27', 'Vibração ao rodar', 'concluido'),
(9, 8, '2024-03-29', 'Correia ressecada', 'pendente'),
(10, 9, '2024-03-30', 'Amortecedor com vazamento', 'pendente');

-- ------------------------------------------------------------
-- Agora:
-- 1. Defina o contexto do seu sistema (Fase 1)
-- 2. Gere dados coerentes com esse contexto com IA (Fase 2)
--    e adicione os dados usando INSERT
-- 3. Formule suas perguntas e escreva os comandos abaixo (Fase 3)
-- ------------------------------------------------------------

-- Pergunta 1 (UPDATE):
-- [escreva aqui uma pergunta que pode ser respondida usando UPDATE] (coloquei o valor errado  do serviço como arrumar com UPDATE)
-- [agora escreva o código que ajuda a responder essa pergunta logo abaixo]

UPDATE item
SET valor = 180.00
WHERE id_item = 1;



-- Pergunta 2 (DELETE):
-- [escreva aqui uma pergunta que pode ser respondida usando DELETE] (um cliente arrumou uma briga aqui na minha oficina como deletar ele nos registros usando DELETE)
-- [agora escreva o código que ajuda a responder essa pergunta logo abaixo]

START TRANSACTION;

DELETE FROM registro
WHERE id_pessoa = 3;

DELETE FROM pessoa
WHERE id_pessoa = 3;

COMMIT;


-- Pergunta 3 (ALTER TABLE):
-- [escreva aqui uma pergunta que pode ser respondida usando ALTER TABLE] (um cliente acabou perdendo o email como eu posso alterar o email usando ALTER TABLE)
-- [agora escreva o código que ajuda a responder essa pergunta logo abaixo]

ALTER TABLE pessoa
ALTER email SET DEFAULT 'mariana.ferreira@email.com';


