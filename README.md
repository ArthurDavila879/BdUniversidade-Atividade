# Banco de Dados - Universidade

Este repositório contém o trabalho de modelagem e implementação de um banco de dados acadêmico de **Universidade**, feito em MySQL.

A proposta do trabalho é representar, em um banco relacional, as principais entidades de um contexto universitário (professores, cursos, alunos, matérias, disciplinas, pré-requisitos e matrículas), incluindo regras de integridade para manter os dados consistentes.

## Estrutura do projeto

- `tables.sql`: script de criação do schema `universidade` e de todas as tabelas com chaves primárias, estrangeiras e `CHECK constraints`.
- `insert.sql`: script de carga inicial com dados de exemplo para testar o modelo.
- `Universidade.mwb`: arquivo do modelo EER criado no MySQL Workbench.

## O que o trabalho modela

### Entidades principais

- **professor**: matrícula e e-mail único do professor.
- **curso**: código, nome, carga horária e professor responsável.
- **aluno**: matrícula, nome e curso (opcional para permitir aluno avulso).
- **materia**: componentes curriculares e carga horária mínima.
- **disciplina**: oferta de uma matéria em um semestre, com professor e número de vagas.

### Relacionamentos

- **curso_has_materia**: relacionamento N:N entre curso e matéria.
- **disciplina_has_aluno**: relacionamento N:N entre disciplina e aluno (matrículas dos alunos nas turmas).
- **emailaluno**: permite múltiplos e-mails por aluno.
- **prerequisito**: controla dependência entre matérias (uma matéria pode exigir outra como pré-requisito).

## Regras de integridade aplicadas

O script inclui validações importantes, por exemplo:

- Faixa válida para matrícula de professor (`1000` a `9999`).
- Formato básico de e-mail para professor e aluno.
- Carga horária mínima de curso e matéria maior que zero.
- `Vagas > 0` em disciplina.
- Semestre no formato `AAAA.1` ou `AAAA.2`.
- Bloqueio de pré-requisito da própria matéria (`CodigoMateriaPre <> Materia_Codigo`).

## Como executar

1. Crie as tabelas:

```sql
SOURCE tables.sql;
```

2. Insira os dados de exemplo:

```sql
SOURCE insert.sql;
```

> Também é possível abrir o arquivo `Universidade.mwb` no MySQL Workbench para visualizar o diagrama EER.



## Objetivo acadêmico

Este trabalho demonstra conceitos de modelagem relacional vistos na disciplina de Banco de Dados:

- modelagem conceitual/lógica,
- normalização básica,
- integridade referencial,
- cardinalidades N:N com tabelas associativas,
- e uso de constraints para validação de regras de negócio.
