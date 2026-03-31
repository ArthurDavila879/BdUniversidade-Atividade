# Projeto Sistema Acadêmico - Banco de Dados II (UVV)

Este repositório contém a modelagem física (SQL) de um sistema universitário desenvolvido para a disciplina de **Banco de Dados II** na **Universidade Vila Velha (UVV)**.

## 📌 Sobre o Projeto
O objetivo foi transformar um "minimundo" acadêmico em um banco de dados relacional funcional, garantindo que todas as regras de negócio fossem validadas diretamente no Schema através de constraints.

### 🏫 Regras de Negócio Implementadas:
* **Cursos e Matérias:** Relacionamento N:M onde cada curso possui carga horária padrão de 3.600h.
* **Disciplinas:** Controle de oferta por semestre com limite rígido de **60 vagas**.
* **Corpo Docente:** Professores possuem matrícula de **exatamente 4 dígitos** e e-mail único.
* **Coordenação:** Regra de exclusividade onde cada professor coordena no máximo um curso.
* **Alunos:** Suporte a múltiplos e-mails por aluno e possibilidade de "alunos avulsos" (sem curso vinculado).
* **Pré-requisitos:** Implementação de auto-relacionamento na tabela de matérias.

## 🛠️ Tecnologias Utilizadas
* **MySQL Workbench** (Modelagem e Engenharia Reversa)
* **SQL (DDL):** Uso avançado de `CHECK CONSTRAINTS`, `UNIQUE INDEX` e `FOREIGN KEYS`.

## 📂 Estrutura do Código
O script realiza a criação das seguintes entidades:
1. `professor` (com validação de 4 dígitos)
2. `curso` (com default de 3600h)
3. `aluno`
4. `materia` (com carga horária mínima de 40h)
5. `disciplina` (com trava de 60 vagas)
6. `emailaluno` (entidade fraca para multivaloração)
7. `prerequisito` (tabela de associação para auto-relacionamento)

---

**Curso:** Ciência da Computação - UVV (2026/1)
