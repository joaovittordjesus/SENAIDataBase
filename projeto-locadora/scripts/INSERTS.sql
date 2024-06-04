INSERT INTO CLIENTE (email, celular, nome, sobrenome, endereco, cidade, estado)
VALUES
    ('cliente11@example.com', '1112223333', 'Rodrigo', 'Santana', 'Rua K, 2324', 'São Luís', 'MA'),
    ('cliente12@example.com', '9998887777', 'Mariana', 'Oliveira', 'Avenida L, 2526', 'Goiânia', 'GO'),
    ('cliente13@example.com', '7778889999', 'Cristina', 'Alves', 'Rua M, 2627', 'Florianópolis', 'SC'),
    ('cliente14@example.com', '3334445555', 'Daniel', 'Martins', 'Avenida N, 2728', 'Porto Velho', 'RO'),
    ('cliente15@example.com', '6665554444', 'Renata', 'Ferreira', 'Rua O, 2829', 'Campo Grande', 'MS');

INSERT INTO COMPROVANTE (comprovante, id_pagamento, id_cliente)
VALUES
    ('Comprovante de pagamento 11', 11, 11),
    ('Comprovante de pagamento 12', 12, 12),
    ('Comprovante de pagamento 13', 13, 13),
    ('Comprovante de pagamento 14', 14, 14),
    ('Comprovante de pagamento 15', 15, 15);

INSERT INTO PAGAMENTO (status_pagamento, valor, forma_pagamento, data_pagamento)
VALUES
    ('PENDENTE', 170.00, 'Cartão de Crédito', '2024-05-11'),
    ('CONCLUÍDO', 180.00, 'Boleto Bancário', '2024-05-12'),
    ('PENDENTE', 190.00, 'Transferência Bancária', '2024-05-13'),
    ('CONCLUÍDO', 200.00, 'Dinheiro', '2024-05-14'),
    ('PENDENTE', 210.00, 'PIX', '2024-05-15');

INSERT INTO LOCACAO (id_cliente, numero_agencia, data_devolucao, data_locacao, valor_total, id_pagamento)
VALUES
    (11, 11, '2024-05-18', '2024-05-11', 160.00, 11),
    (12, 12, '2024-05-19', '2024-05-12', 150.00, 12),
    (13, 13, '2024-05-20', '2024-05-13', 140.00, 13),
    (14, 14, '2024-05-21', '2024-05-14', 130.00, 14),
    (15, 15, '2024-05-22', '2024-05-15', 120.00, 15);

INSERT INTO CARRO (numero_agencia, placa, modelo, ano, tipo, disponibilidade, id_locacao, valor_total)
VALUES
    (11, 'EFG1234', 'Toyota Etios', '2019-01-01', 'C', 'DISPONIVEL', 11, 110.00),
    (12, 'HIJ5678', 'Chevrolet Prisma', '2020-01-01', 'C', 'DISPONIVEL', 12, 100.00),
    (13, 'KLM9012', 'Ford Fiesta', '2018-01-01', 'C', 'DISPONIVEL', 13, 90.00),
    (14, 'NOP3456', 'Hyundai Creta', '2021-01-01', 'C', 'DISPONIVEL', 14, 80.00),
    (15, 'QRS7890', 'Volkswagen Polo', '2017-01-01', 'C', 'DISPONIVEL', 15, 70.00);

INSERT INTO FEEDBACK (comentario, avaliacao, id_cliente)
VALUES
    ('Excelente atendimento, recomendo!', '5 estrelas', 11),
    ('Carro limpo e em ótimo estado.', '4 estrelas', 12),
    ('Preço acessível e bom atendimento.', '5 estrelas', 13),
    ('Facilidade na reserva e retirada do carro.', '4 estrelas', 14),
    ('Tive um pequeno problema com o carro, mas foi resolvido.', '4 estrelas', 15);

INSERT INTO FUNCIONARIO (salario, nome, sobrenome, data_contratacao, cargo, numero_agencia)
VALUES
    (3000.00, 'Gabriel', 'Sousa', '2023-01-01', 'Atendente', 11),
    (3100.00, 'Amanda', 'Albuquerque', '2022-01-01', 'Gerente', 12),
    (3200.00, 'Ricardo', 'Fernandes', '2021-01-01', 'Atendente', 13),
    (3300.00, 'Jéssica', 'Santos', '2020-01-01', 'Gerente', 14),
    (3400.00, 'Vinícius', 'Lima', '2019-01-01', 'Analista', 15);

INSERT INTO ORDEM_MANUTENCAO (id_manutencao, data_emissao, local, descricao, objetivo, id_carro, id_locacao, status)
VALUES
    (11, '2024-05-11', 'Oficina Mecânica K', 'Realizar manutenção preventiva', 'Manter o veículo em bom estado de funcionamento', 11, 11, 'PENDENTE'),
    (12, '2024-05-12', 'Oficina Mecânica L', 'Realizar manutenção corretiva', 'Corrigir problema de vazamento de óleo', 12, 12, 'PENDENTE'),
    (13, '2024-05-13', 'Oficina Mecânica M', 'Realizar manutenção preventiva', 'Garantir a segurança do veículo', 13, 13, 'PENDENTE'),
    (14, '2024-05-14', 'Oficina Mecânica N', 'Realizar manutenção corretiva', 'Resolver falha no sistema de ar condicionado', 14, 14, 'PENDENTE'),
    (15, '2024-05-15', 'Oficina Mecânica O', 'Realizar manutenção preventiva', 'Prevenir problemas mecânicos', 15, 15, 'PENDENTE');


