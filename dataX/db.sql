BEGIN;
--
-- Create model Aluno
--
CREATE TABLE "core_aluno" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "data_conclusao" date NOT NULL);
--
-- Create model Campus
--
CREATE TABLE "core_campus" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "nome" varchar(50) NOT NULL);
--
-- Create model Cor
--
CREATE TABLE "core_cor" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "nome" varchar(50) NOT NULL);
--
-- Create model Curso
--
CREATE TABLE "core_curso" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "nome" varchar(50) NOT NULL);
--
-- Create model Departamento
--
CREATE TABLE "core_departamento" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "nome" varchar(50) NOT NULL, "cursos_id" integer NOT NULL REFERENCES "core_curso" ("id"));
--
-- Create model Endereco
--
CREATE TABLE "core_endereco" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "logradouro" varchar(255) NOT NULL, "CEP" varchar(15) NOT NULL, "data_cadastro" date NOT NULL);
--
-- Create model Estado
--
CREATE TABLE "core_estado" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "nome" varchar(50) NOT NULL);
--
-- Create model Estrutura
--
CREATE TABLE "core_estrutura" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "nome" varchar(50) NOT NULL);
--
-- Create model Forma_Ingresso
--
CREATE TABLE "core_forma_ingresso" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "nome" varchar(100) NOT NULL);
--
-- Create model Matriz_Curricular
--
CREATE TABLE "core_matriz_curricular" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "nome" varchar(50) NOT NULL, "estrutura_id" integer NOT NULL REFERENCES "core_estrutura" ("id"));
--
-- Create model Municipio
--
CREATE TABLE "core_municipio" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "nome" varchar(50) NOT NULL);
--
-- Create model Periodo
--
CREATE TABLE "core_periodo" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "ano" integer NOT NULL, "semestre" integer NOT NULL);
--
-- Create model Pessoa
--
CREATE TABLE "core_pessoa" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "data_nascimento" date NOT NULL, "data_conclusao_ensino_medio" date NOT NULL, "codigo_social" varchar(255) NOT NULL, "cor_id" integer NOT NULL UNIQUE REFERENCES "core_cor" ("id"), "endereco_id" integer NOT NULL REFERENCES "core_endereco" ("id"), "matriculas_id" integer NOT NULL REFERENCES "core_aluno" ("id"));
--
-- Create model Sexo
--
CREATE TABLE "core_sexo" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "sexo" varchar(50) NOT NULL);
--
-- Create model Situacao
--
CREATE TABLE "core_situacao" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "nome" varchar(50) NOT NULL);
--
-- Add field sexo to pessoa
--
ALTER TABLE "core_pessoa" RENAME TO "core_pessoa__old";
CREATE TABLE "core_pessoa" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "data_nascimento" date NOT NULL, "data_conclusao_ensino_medio" date NOT NULL, "codigo_social" varchar(255) NOT NULL, "cor_id" integer NOT NULL UNIQUE REFERENCES "core_cor" ("id"), "endereco_id" integer NOT NULL REFERENCES "core_endereco" ("id"), "matriculas_id" integer NOT NULL REFERENCES "core_aluno" ("id"), "sexo_id" integer NOT NULL UNIQUE REFERENCES "core_sexo" ("id"));
INSERT INTO "core_pessoa" ("endereco_id", "codigo_social", "cor_id", "data_nascimento", "id", "sexo_id", "data_conclusao_ensino_medio", "matriculas_id") SELECT "endereco_id", "codigo_social", "cor_id", "data_nascimento", "id", NULL, "data_conclusao_ensino_medio", "matriculas_id" FROM "core_pessoa__old";
DROP TABLE "core_pessoa__old";
CREATE INDEX "core_departamento_a4c10983" ON "core_departamento" ("cursos_id");
CREATE INDEX "core_matriz_curricular_65bfa311" ON "core_matriz_curricular" ("estrutura_id");
CREATE INDEX "core_pessoa_5f6f0b92" ON "core_pessoa" ("endereco_id");
CREATE INDEX "core_pessoa_f17079a9" ON "core_pessoa" ("matriculas_id");
--
-- Add field municipios to estado
--
ALTER TABLE "core_estado" RENAME TO "core_estado__old";
CREATE TABLE "core_estado" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "nome" varchar(50) NOT NULL, "municipios_id" integer NOT NULL REFERENCES "core_municipio" ("id"));
INSERT INTO "core_estado" ("nome", "id", "municipios_id") SELECT "nome", "id", NULL FROM "core_estado__old";
DROP TABLE "core_estado__old";
CREATE INDEX "core_estado_07307593" ON "core_estado" ("municipios_id");
--
-- Add field municipio to endereco
--
ALTER TABLE "core_endereco" RENAME TO "core_endereco__old";
CREATE TABLE "core_endereco" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "logradouro" varchar(255) NOT NULL, "CEP" varchar(15) NOT NULL, "data_cadastro" date NOT NULL, "municipio_id" integer NOT NULL REFERENCES "core_municipio" ("id"));
INSERT INTO "core_endereco" ("CEP", "municipio_id", "id", "data_cadastro", "logradouro") SELECT "CEP", NULL, "id", "data_cadastro", "logradouro" FROM "core_endereco__old";
DROP TABLE "core_endereco__old";
CREATE INDEX "core_endereco_40924980" ON "core_endereco" ("municipio_id");
--
-- Add field matrizes_curriculares to curso
--
ALTER TABLE "core_curso" RENAME TO "core_curso__old";
CREATE TABLE "core_curso" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "nome" varchar(50) NOT NULL, "matrizes_curriculares_id" integer NOT NULL REFERENCES "core_matriz_curricular" ("id"));
INSERT INTO "core_curso" ("nome", "id", "matrizes_curriculares_id") SELECT "nome", "id", NULL FROM "core_curso__old";
DROP TABLE "core_curso__old";
CREATE INDEX "core_curso_16cc36dc" ON "core_curso" ("matrizes_curriculares_id");
--
-- Add field departamentos to campus
--
ALTER TABLE "core_campus" RENAME TO "core_campus__old";
CREATE TABLE "core_campus" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "nome" varchar(50) NOT NULL, "departamentos_id" integer NOT NULL REFERENCES "core_departamento" ("id"));
INSERT INTO "core_campus" ("nome", "departamentos_id", "id") SELECT "nome", NULL, "id" FROM "core_campus__old";
DROP TABLE "core_campus__old";
CREATE INDEX "core_campus_ffea3b2b" ON "core_campus" ("departamentos_id");
--
-- Add field forma_ingresso to aluno
--
ALTER TABLE "core_aluno" RENAME TO "core_aluno__old";
CREATE TABLE "core_aluno" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "data_conclusao" date NOT NULL, "forma_ingresso_id" integer NOT NULL REFERENCES "core_forma_ingresso" ("id"));
INSERT INTO "core_aluno" ("data_conclusao", "forma_ingresso_id", "id") SELECT "data_conclusao", NULL, "id" FROM "core_aluno__old";
DROP TABLE "core_aluno__old";
CREATE INDEX "core_aluno_e68927ca" ON "core_aluno" ("forma_ingresso_id");
--
-- Add field matriz_curricular to aluno
--
ALTER TABLE "core_aluno" RENAME TO "core_aluno__old";
CREATE TABLE "core_aluno" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "data_conclusao" date NOT NULL, "forma_ingresso_id" integer NOT NULL REFERENCES "core_forma_ingresso" ("id"), "matriz_curricular_id" integer NOT NULL REFERENCES "core_matriz_curricular" ("id"));
INSERT INTO "core_aluno" ("data_conclusao", "forma_ingresso_id", "id", "matriz_curricular_id") SELECT "data_conclusao", "forma_ingresso_id", "id", NULL FROM "core_aluno__old";
DROP TABLE "core_aluno__old";
CREATE INDEX "core_aluno_e68927ca" ON "core_aluno" ("forma_ingresso_id");
CREATE INDEX "core_aluno_5c53c03e" ON "core_aluno" ("matriz_curricular_id");
--
-- Add field periodo_conclusao to aluno
--
ALTER TABLE "core_aluno" RENAME TO "core_aluno__old";
CREATE TABLE "core_aluno" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "data_conclusao" date NOT NULL, "forma_ingresso_id" integer NOT NULL REFERENCES "core_forma_ingresso" ("id"), "matriz_curricular_id" integer NOT NULL REFERENCES "core_matriz_curricular" ("id"), "periodo_conclusao_id" integer NULL UNIQUE REFERENCES "core_periodo" ("id"));
INSERT INTO "core_aluno" ("data_conclusao", "forma_ingresso_id", "id", "matriz_curricular_id", "periodo_conclusao_id") SELECT "data_conclusao", "forma_ingresso_id", "id", "matriz_curricular_id", NULL FROM "core_aluno__old";
DROP TABLE "core_aluno__old";
CREATE INDEX "core_aluno_e68927ca" ON "core_aluno" ("forma_ingresso_id");
CREATE INDEX "core_aluno_5c53c03e" ON "core_aluno" ("matriz_curricular_id");
--
-- Add field periodo_matricula to aluno
--
ALTER TABLE "core_aluno" RENAME TO "core_aluno__old";
CREATE TABLE "core_aluno" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "data_conclusao" date NOT NULL, "forma_ingresso_id" integer NOT NULL REFERENCES "core_forma_ingresso" ("id"), "matriz_curricular_id" integer NOT NULL REFERENCES "core_matriz_curricular" ("id"), "periodo_conclusao_id" integer NULL UNIQUE REFERENCES "core_periodo" ("id"), "periodo_matricula_id" integer NOT NULL UNIQUE REFERENCES "core_periodo" ("id"));
INSERT INTO "core_aluno" ("data_conclusao", "periodo_conclusao_id", "forma_ingresso_id", "periodo_matricula_id", "id", "matriz_curricular_id") SELECT "data_conclusao", "periodo_conclusao_id", "forma_ingresso_id", NULL, "id", "matriz_curricular_id" FROM "core_aluno__old";
DROP TABLE "core_aluno__old";
CREATE INDEX "core_aluno_e68927ca" ON "core_aluno" ("forma_ingresso_id");
CREATE INDEX "core_aluno_5c53c03e" ON "core_aluno" ("matriz_curricular_id");
--
-- Add field situacao to aluno
--
ALTER TABLE "core_aluno" RENAME TO "core_aluno__old";
CREATE TABLE "core_aluno" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "data_conclusao" date NOT NULL, "forma_ingresso_id" integer NOT NULL REFERENCES "core_forma_ingresso" ("id"), "matriz_curricular_id" integer NOT NULL REFERENCES "core_matriz_curricular" ("id"), "periodo_conclusao_id" integer NULL UNIQUE REFERENCES "core_periodo" ("id"), "periodo_matricula_id" integer NOT NULL UNIQUE REFERENCES "core_periodo" ("id"), "situacao_id" integer NOT NULL REFERENCES "core_situacao" ("id"));
INSERT INTO "core_aluno" ("data_conclusao", "periodo_conclusao_id", "forma_ingresso_id", "periodo_matricula_id", "id", "matriz_curricular_id", "situacao_id") SELECT "data_conclusao", "periodo_conclusao_id", "forma_ingresso_id", "periodo_matricula_id", "id", "matriz_curricular_id", NULL FROM "core_aluno__old";
DROP TABLE "core_aluno__old";
CREATE INDEX "core_aluno_e68927ca" ON "core_aluno" ("forma_ingresso_id");
CREATE INDEX "core_aluno_5c53c03e" ON "core_aluno" ("matriz_curricular_id");
CREATE INDEX "core_aluno_f0efdd7a" ON "core_aluno" ("situacao_id");
COMMIT;
