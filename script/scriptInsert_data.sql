USE `star_schema_professor`;

-- Inserindo dados na Dimensão Professor
INSERT INTO Dim_professor (nome_professor, especialidade_professor, titulacao)
VALUES 
    ('Carlos Silva', 'Matemática', 'Doutor'),
    ('Ana Souza', 'Física', 'Mestre'),
    ('Roberto Lima', 'Química', 'Doutor'),
    ('Mariana Rocha', 'História', 'Mestre'),
    ('Fernanda Costa', 'Literatura', 'Especialista'),
    ('Paulo Mendes', 'Engenharia', 'Doutor'),
    ('Juliana Ribeiro', 'Biologia', 'Mestre'),
    ('Fernando Alves', 'Filosofia', 'Especialista'),
    ('Tatiane Moreira', 'Computação', 'Doutor'),
    ('Ricardo Gonçalves', 'Estatística', 'Mestre');

-- Inserindo dados na Dimensão Curso
INSERT INTO Dim_curso (nome_curso, carga_horaria, nivel)
VALUES 
    ('Cálculo I', 60, 'Graduação'),
    ('Física Experimental', 40, 'Graduação'),
    ('Química Geral', 50, 'Graduação'),
    ('História Antiga', 45, 'Graduação'),
    ('Literatura Brasileira', 55, 'Pós-Graduação'),
    ('Algoritmos', 80, 'Graduação'),
    ('Probabilidade', 50, 'Graduação'),
    ('Ética Profissional', 30, 'Graduação'),
    ('Banco de Dados', 60, 'Pós-Graduação'),
    ('Sociologia', 40, 'Graduação');

-- Inserindo dados na Dimensão Departamento
INSERT INTO Dim_departamento (nome_departamento, localizacao)
VALUES 
    ('Ciências Exatas', 'Bloco A'),
    ('Ciências Humanas', 'Bloco B'),
    ('Engenharia', 'Bloco C'),
    ('Educação', 'Bloco D'),
    ('Letras', 'Bloco E'),
    ('Computação', 'Bloco F'),
    ('Biológicas', 'Bloco G'),
    ('Filosofia', 'Bloco H'),
    ('Estatística', 'Bloco I'),
    ('Administração', 'Bloco J');

-- Inserindo dados na Dimensão Data
INSERT INTO Dim_Data (data_completa, ano, mes, dia, dia_da_semana, trimestre)
VALUES 
    ('2024-03-15', 2024, 3, 15, 'Sexta-feira', 'Q1'),
    ('2024-04-20', 2024, 4, 20, 'Sábado', 'Q2'),
    ('2024-05-10', 2024, 5, 10, 'Quarta-feira', 'Q2'),
    ('2024-06-25', 2024, 6, 25, 'Domingo', 'Q2'),
    ('2024-08-30', 2024, 8, 30, 'Quinta-feira', 'Q3'),
    ('2024-09-12', 2024, 9, 12, 'Terça-feira', 'Q3'),
    ('2024-10-05', 2024, 10, 5, 'Sábado', 'Q4'),
    ('2024-11-18', 2024, 11, 18, 'Segunda-feira', 'Q4'),
    ('2024-12-07', 2024, 12, 7, 'Quinta-feira', 'Q4'),
    ('2025-01-10', 2025, 1, 10, 'Quarta-feira', 'Q1');

-- Inserindo dados na Tabela Fato Professores
INSERT INTO Fato_professores (qtd_alunos, carga_horaria_total, avaliacao_media, fk_id_departamento, fk_id_curso, fk_id_Data, fk_id_professor)
VALUES 
    (35, 60, 4.7, 1, 1, 1, 1), -- Carlos Silva, Cálculo I, Ciências Exatas
    (28, 40, 4.3, 1, 2, 2, 2), -- Ana Souza, Física Experimental, Ciências Exatas
    (30, 50, 4.1, 3, 3, 3, 3), -- Roberto Lima, Química Geral, Engenharia
    (22, 45, 4.5, 2, 4, 4, 4), -- Mariana Rocha, História Antiga, Humanas
    (40, 55, 4.8, 5, 5, 5, 5), -- Fernanda Costa, Literatura Brasileira, Letras
    (50, 80, 4.9, 6, 6, 6, 6), -- Paulo Mendes, Algoritmos, Computação
    (18, 50, 4.0, 7, 7, 7, 7), -- Juliana Ribeiro, Probabilidade, Biológicas
    (27, 30, 3.9, 8, 8, 8, 8), -- Fernando Alves, Ética Profissional, Filosofia
    (33, 60, 4.2, 9, 9, 9, 9), -- Tatiane Moreira, Banco de Dados, Estatística
    (29, 40, 4.6, 10, 10, 10, 10); -- Ricardo Gonçalves, Sociologia, Administração
