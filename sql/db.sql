BEGIN;
--
-- Create model Aluno
--
CREATE TABLE "core_aluno" ("id" serial NOT NULL PRIMARY KEY, "matricula" varchar(255) NOT NULL);
--
-- Create model Campus
--
CREATE TABLE "core_campus" ("id" serial NOT NULL PRIMARY KEY, "nome" varchar(50) NOT NULL);
--
-- Create model Cor
--
CREATE TABLE "core_cor" ("id" serial NOT NULL PRIMARY KEY, "nome" varchar(50) NOT NULL, "sigla" varchar(3) NOT NULL);
--
-- Create model Curso
--
CREATE TABLE "core_curso" ("id" serial NOT NULL PRIMARY KEY, "nome" varchar(255) NOT NULL);
--
-- Create model Departamento
--
CREATE TABLE "core_departamento" ("id" serial NOT NULL PRIMARY KEY, "nome" varchar(255) NOT NULL, "campus_id" integer NOT NULL);
--
-- Create model Endereco
--
CREATE TABLE "core_endereco" ("id" serial NOT NULL PRIMARY KEY, "logradouro" varchar(255) NOT NULL, "CEP" varchar(15) NOT NULL, "data_cadastro" date NOT NULL);
--
-- Create model Estado
--
CREATE TABLE "core_estado" ("id" serial NOT NULL PRIMARY KEY, "nome" varchar(50) NOT NULL);
--
-- Create model Municipio
--
CREATE TABLE "core_municipio" ("id" serial NOT NULL PRIMARY KEY, "nome" varchar(50) NOT NULL, "estado_id" integer NOT NULL);
--
-- Create model Periodo
--
CREATE TABLE "core_periodo" ("id" serial NOT NULL PRIMARY KEY, "ano" integer NOT NULL, "semestre" integer NOT NULL);
--
-- Create model Pessoa
--
CREATE TABLE "core_pessoa" ("id" serial NOT NULL PRIMARY KEY, "data_nascimento" date NULL, "data_conclusao_ensino_medio" date NULL, "codigo_social" varchar(255) NOT NULL, "cor_id" integer NOT NULL);
--
-- Create model Sexo
--
CREATE TABLE "core_sexo" ("id" serial NOT NULL PRIMARY KEY, "nome" varchar(50) NOT NULL, "sigla" varchar(1) NOT NULL);
--
-- Create model Situacao
--
CREATE TABLE "core_situacao" ("id" serial NOT NULL PRIMARY KEY, "nome" varchar(50) NOT NULL);
--
-- Create model Situacao_Aluno
--
CREATE TABLE "core_situacao_aluno" ("id" serial NOT NULL PRIMARY KEY, "data_registro" date NULL, "aluno_id" integer NOT NULL, "periodo_id" integer NOT NULL, "situacao_id" integer NOT NULL);
--
-- Add field sexo to pessoa
--
ALTER TABLE "core_pessoa" ADD COLUMN "sexo_id" integer NOT NULL;
ALTER TABLE "core_pessoa" ALTER COLUMN "sexo_id" DROP DEFAULT;
--
-- Add field municipio to endereco
--
ALTER TABLE "core_endereco" ADD COLUMN "municipio_id" integer NOT NULL;
ALTER TABLE "core_endereco" ALTER COLUMN "municipio_id" DROP DEFAULT;
--
-- Add field pessoa to endereco
--
ALTER TABLE "core_endereco" ADD COLUMN "pessoa_id" integer NOT NULL;
ALTER TABLE "core_endereco" ALTER COLUMN "pessoa_id" DROP DEFAULT;
--
-- Add field departamentos to curso
--
ALTER TABLE "core_curso" ADD COLUMN "departamentos_id" integer NOT NULL;
ALTER TABLE "core_curso" ALTER COLUMN "departamentos_id" DROP DEFAULT;
--
-- Add field curso to aluno
--
ALTER TABLE "core_aluno" ADD COLUMN "curso_id" integer NOT NULL;
ALTER TABLE "core_aluno" ALTER COLUMN "curso_id" DROP DEFAULT;
--
-- Add field pessoa to aluno
--
ALTER TABLE "core_aluno" ADD COLUMN "pessoa_id" integer NOT NULL;
ALTER TABLE "core_aluno" ALTER COLUMN "pessoa_id" DROP DEFAULT;
ALTER TABLE "core_departamento" ADD CONSTRAINT "core_departamento_campus_id_cfa8115c_fk_core_campus_id" FOREIGN KEY ("campus_id") REFERENCES "core_campus" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "core_departamento_29ddca3f" ON "core_departamento" ("campus_id");
ALTER TABLE "core_municipio" ADD CONSTRAINT "core_municipio_estado_id_8d07bbda_fk_core_estado_id" FOREIGN KEY ("estado_id") REFERENCES "core_estado" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "core_municipio_2c189993" ON "core_municipio" ("estado_id");
ALTER TABLE "core_pessoa" ADD CONSTRAINT "core_pessoa_cor_id_3037fdaa_fk_core_cor_id" FOREIGN KEY ("cor_id") REFERENCES "core_cor" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "core_pessoa_58374adc" ON "core_pessoa" ("cor_id");
ALTER TABLE "core_situacao_aluno" ADD CONSTRAINT "core_situacao_aluno_aluno_id_958141f5_fk_core_aluno_id" FOREIGN KEY ("aluno_id") REFERENCES "core_aluno" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "core_situacao_aluno" ADD CONSTRAINT "core_situacao_aluno_periodo_id_b33460dd_fk_core_periodo_id" FOREIGN KEY ("periodo_id") REFERENCES "core_periodo" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "core_situacao_aluno" ADD CONSTRAINT "core_situacao_aluno_situacao_id_6311dc8c_fk_core_situacao_id" FOREIGN KEY ("situacao_id") REFERENCES "core_situacao" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "core_situacao_aluno_3bc25354" ON "core_situacao_aluno" ("aluno_id");
CREATE INDEX "core_situacao_aluno_d8fba268" ON "core_situacao_aluno" ("periodo_id");
CREATE INDEX "core_situacao_aluno_f0efdd7a" ON "core_situacao_aluno" ("situacao_id");
CREATE INDEX "core_pessoa_68bc6daa" ON "core_pessoa" ("sexo_id");
ALTER TABLE "core_pessoa" ADD CONSTRAINT "core_pessoa_sexo_id_cbe15231_fk_core_sexo_id" FOREIGN KEY ("sexo_id") REFERENCES "core_sexo" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "core_endereco_40924980" ON "core_endereco" ("municipio_id");
ALTER TABLE "core_endereco" ADD CONSTRAINT "core_endereco_municipio_id_545b61d8_fk_core_municipio_id" FOREIGN KEY ("municipio_id") REFERENCES "core_municipio" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "core_endereco_4d5d442c" ON "core_endereco" ("pessoa_id");
ALTER TABLE "core_endereco" ADD CONSTRAINT "core_endereco_pessoa_id_b7a8dbff_fk_core_pessoa_id" FOREIGN KEY ("pessoa_id") REFERENCES "core_pessoa" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "core_curso_ffea3b2b" ON "core_curso" ("departamentos_id");
ALTER TABLE "core_curso" ADD CONSTRAINT "core_curso_departamentos_id_f7adc806_fk_core_departamento_id" FOREIGN KEY ("departamentos_id") REFERENCES "core_departamento" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "core_aluno_6f899f0d" ON "core_aluno" ("curso_id");
ALTER TABLE "core_aluno" ADD CONSTRAINT "core_aluno_curso_id_88e254a2_fk_core_curso_id" FOREIGN KEY ("curso_id") REFERENCES "core_curso" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "core_aluno_4d5d442c" ON "core_aluno" ("pessoa_id");
ALTER TABLE "core_aluno" ADD CONSTRAINT "core_aluno_pessoa_id_9caeb99e_fk_core_pessoa_id" FOREIGN KEY ("pessoa_id") REFERENCES "core_pessoa" ("id") DEFERRABLE INITIALLY DEFERRED;
COMMIT;
