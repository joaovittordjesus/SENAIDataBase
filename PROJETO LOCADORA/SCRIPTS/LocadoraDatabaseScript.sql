CREATE TABLE CLIENTE(
    id_cliente SERIAL PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    celular VARCHAR(20) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL,
);

CREATE TABLE AGENCIA (
    numero_agencia SERIAL PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(100) NOT NULL,
    endereco VARCHAR(255) NOT NULL
);

CREATE TABLE COMPROVANTE (
    id_comprovante SERIAL PRIMARY KEY,
    comprovante VARCHAR(255) NOT NULL
);

CREATE TABLE PAGAMENTO (
    id_pagamento SERIAL PRIMARY KEY,
    status_pagamento VARCHAR(100) DEFAULT 'PENDENTE' NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    forma_pagamento VARCHAR(100) NOT NULL,
    data_pagamento DATE NOT NULL,
    id_comprovante INT NOT NULL,
    FOREIGN KEY (id_comprovante) REFERENCES COMPROVANTE (id_comprovante)
);

CREATE TABLE LOCACAO (
    id_locacao SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    numero_agencia INT NOT NULL,
    foreign key (numero_agencia) REFERENCES AGENCIA(numero_agencia),
    data_devolucao DATE DEFAULT CURRENT_DATE NOT NULL,
    data_locacao DATE DEFAULT CURRENT_DATE NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL
    id_pagamento SERIAL NOT NULL,
    FOREIGN KEY (id_pagamento) REFERENCES PAGAMENTO(id_pagamento)
);

CREATE TABLE CARRO (
    id_carro SERIAL PRIMARY KEY,
    numero_agencia INT NOT NULL,
    FOREIGN KEY (numero_agencia) REFERENCES AGENCIA (numero_agencia),   
    placa VARCHAR(100) NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    ano DATE NOT NULL,
    tipo VARCHAR(1),
    disponibilidade VARCHAR(50) DEFAULT 'DISPONIVEL' NOT NULL,
    id_locacao INT NOT NULL,
    FOREIGN KEY (id_locacao) REFERENCES LOCACAO(id_locacao),
    valor_total DECIMAL NOT NULL
);

CREATE TABLE FEEDBACK (
    id_feedback SERIAL PRIMARY KEY,
    comentario VARCHAR(255) NOT NULL,
    avaliacao VARCHAR(255) NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE (id_cliente)

);

CREATE TABLE FUNCIONARIO (
    id_funcionario SERIAL PRIMARY KEY,
    salario DECIMAL(10,2) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    data_contratacao DATE NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    numero_agencia INT NOT NULL,
    FOREIGN KEY(numero_agencia) REFERENCES AGENCIA(numero_agencia)
);

CREATE TABLE MANUTENCAO (
    id_manutencao SERIAL PRIMARY KEY,
    custo DECIMAL(10,2) NOT NULL,
    data_manutencao DATE DEFAULT CURRENT_DATE NOT NULL,
    km INT NOT NULL,
    tipo_manutencao VARCHAR(100) NOT NULL,
    descricao VARCHAR(1000)
);

CREATE TABLE ORDEM_MANUTENCAO (
    id_ordem_manutencao SERIAL PRIMARY KEY,
	id_manutencao INT NOT NULL,
    data_emissao DATE DEFAULT CURRENT_DATE NOT NULL,
    local VARCHAR(100),
    descricao VARCHAR(1000),
    objetivo VARCHAR(1000),
    id_carro INT NOT NULL,
    id_locacao INT NOT NULL,
    FOREIGN KEY(id_manutencao) REFERENCES MANUTENCAO (id_manutencao),
    FOREIGN KEY(id_locacao) REFERENCES LOCACAO (id_locacao),
	FOREIGN KEY(id_carro) REFERENCES CARRO (id_carro)
);