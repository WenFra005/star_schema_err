# Projeto Star Schema - Análise de Professores

## 📖 Descrição

Este projeto consiste na modelagem de um **esquema estrela (Star Schema)** para análise de dados relacionados aos **professores**, seus **cursos ministrados**, **departamentos** e **datas** de oferta. O objetivo é facilitar consultas analíticas sobre a atuação dos professores em diferentes cursos e departamentos.

---

## 🏗️ Modelagem Dimensional

A modelagem segue um esquema estrela com uma **tabela fato** central e várias **tabelas dimensão**, conforme descrito abaixo.

### **Tabela Fato: `Fato_professores`**
Armazena as métricas a serem analisadas:

| Coluna               | Tipo          | Descrição                        |
|---------------------|---------------|----------------------------------|
| `id_professores`      | INT (PK)       | Identificador único da tabela fato |
| `qtd_alunos`          | INT            | Quantidade de alunos matriculados |
| `carga_horaria_total` | INT            | Carga horária total ministrada   |
| `avaliacao_media`     | FLOAT          | Avaliação média do curso         |
| `fk_id_departamento`  | INT (FK)       | Chave estrangeira para departamento |
| `fk_id_curso`         | INT (FK)       | Chave estrangeira para curso     |
| `fk_id_Data`          | INT (FK)       | Chave estrangeira para data      |
| `fk_id_professor`     | INT (FK)       | Chave estrangeira para professor |

---

### **Tabelas Dimensão**

1. **Dimensão Professor: `Dim_professor`**  
   Contém informações detalhadas sobre os professores.  
   - `id_professor` (PK) - Identificador único do professor  
   - `nome_professor` - Nome do professor  
   - `especialidade_professor` - Especialidade do professor  
   - `titulacao` - Titulação do professor  

2. **Dimensão Curso: `Dim_curso`**  
   Contém detalhes sobre os cursos oferecidos.  
   - `id_curso` (PK) - Identificador único do curso  
   - `nome_curso` - Nome do curso  
   - `carga_horaria` - Duração do curso em horas  
   - `nivel` - Nível acadêmico do curso  

3. **Dimensão Departamento: `Dim_departamento`**  
   Contém informações sobre os departamentos.  
   - `id_departamento` (PK) - Identificador único do departamento  
   - `nome_departamento` - Nome do departamento  
   - `localizacao` - Localização do departamento  

4. **Dimensão Data: `Dim_Data`**  
   Contém dados relacionados às datas das ofertas dos cursos.  
   - `id_Data` (PK) - Identificador único da data  
   - `data_completa` - Data completa da oferta  
   - `ano`, `mes`, `dia` - Componentes da data  
   - `dia_da_semana` - Dia da semana  
   - `trimestre` - Trimestre do ano  

---

## 🔗 Relacionamentos (Cardinalidade)

As relações seguem uma estrutura **1:N**, em que:

- **Dim_professor → Fato_professores (1:N)**  
- **Dim_curso → Fato_professores (1:N)**  
- **Dim_departamento → Fato_professores (1:N)**  
- **Dim_Data → Fato_professores (1:N)**  

Regras de integridade:  
- `ON DELETE RESTRICT` – Evita a exclusão de registros caso haja dependências na tabela fato.  
- `ON UPDATE CASCADE` – Atualiza automaticamente as chaves nas tabelas fato ao mudar nas dimensões.  

---

## 📂 Scripts SQL

### **Criação das tabelas**
Os scripts SQL para criação das tabelas podem ser encontrados no arquivo [`schema.sql`](./schema.sql).  

### **Inserção de dados**
Os dados de exemplo estão disponíveis no arquivo [`data_inserts.sql`](./data_inserts.sql).  

---

## 🛠️ Ferramentas Utilizadas
* **Banco de Dados**: MySQL
* **Ferramenta de Modelagem**: MySQL Workbench
* **Scripts SQL**: MySQL
