from __future__ import unicode_literals

from django.db import models


class Estrutura(models.Model):
    nome = models.CharField(max_length=50)

class Matriz_Curricular(models.Model):
    nome = models.CharField(max_length=50)
    estrutura = models.ForeignKey(Estrutura)

class Curso (models.Model):
    nome = models.CharField(max_length=50)
    matrizes_curriculares = models.ForeignKey(Matriz_Curricular)

class Departamento(models.Model):
    nome = models.CharField(max_length=50)
    cursos = models.ForeignKey(Curso)

class Campus (models.Model):
    nome = models.CharField(max_length=50)
    departamentos = models.ForeignKey(Departamento)

class Situacao (models.Model):
    nome = models.CharField(max_length=50)

class Periodo (models.Model):
     ano = models.IntegerField()
     semestre = models.IntegerField()

class Forma_Ingresso(models.Model):
    nome = models.CharField(max_length=100)

class Aluno (models.Model):
    periodo_matricula = models.OneToOneField(Periodo,related_name="periodo_matricula")
    periodo_conclusao = models.OneToOneField(Periodo,related_name="periodo_conclusao", blank=True,null=True,)
    data_conclusao = models.DateField()
    matriz_curricular = models.ForeignKey(Matriz_Curricular)
    situacao = models.ForeignKey(Situacao)
    forma_ingresso = models.ForeignKey(Forma_Ingresso)

class Cor (models.Model):
    nome = models.CharField(max_length=50)

class Sexo (models.Model):
    sexo = models.CharField(max_length=50)

class Municipio (models.Model):
    nome = models.CharField(max_length=50)

class Estado (models.Model):
    nome = models.CharField(max_length=50)
    municipios = models.ForeignKey(Municipio)

class Endereco (models.Model):
    logradouro = models.CharField(max_length=255)
    municipio = models.ForeignKey(Municipio)
    CEP = models.CharField(max_length=15)
    data_cadastro = models.DateField()

class Pessoa (models.Model):
    data_nascimento = models.DateField()
    data_conclusao_ensino_medio = models.DateField()
    codigo_social = models.CharField(max_length=255)
    cor = models.OneToOneField(Cor)
    sexo = models.OneToOneField(Sexo)
    matriculas = models.ForeignKey(Aluno)
    endereco = models.ForeignKey(Endereco)
