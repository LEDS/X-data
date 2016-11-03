from django.db import models
from django.utils import timezone

class Campus (models.Model):
    nome = models.CharField(max_length=50)

class Departamento(models.Model):
    nome = models.CharField(max_length=255)
    campus = models.ForeignKey(Campus)

class Curso (models.Model):
    nome = models.CharField(max_length=255)
    departamentos = models.ForeignKey(Departamento)

class Cor (models.Model):
    nome = models.CharField(max_length=50)
    sigla = models.CharField(max_length=3)

class Sexo (models.Model):
    nome = models.CharField(max_length=50)
    sigla = models.CharField(max_length=1)

class Periodo(models.Model):
    ano = models.IntegerField()
    semestre = models.IntegerField()

class Situacao (models.Model):
    nome = models.CharField(max_length=50)

class Pessoa(models.Model):
    data_nascimento = models.DateField()
    data_conclusao_ensino_medio = models.DateField()
    codigo_social = models.CharField(max_length=255)
    cor = models.ForeignKey(Cor)
    sexo = models.ForeignKey(Sexo)

class Aluno (models.Model):
    data_conclusao = models.DateField(blank=True,null=True,)
    curso = models.ForeignKey(Curso)
    pessoa = models.ForeignKey(Pessoa)

class Situacao_Aluno(models.Model):
    data = models.DateField()
    aluno = models.ForeignKey(Aluno)
    situacao = models.ForeignKey(Situacao)

class Estado (models.Model):
    nome = models.CharField(max_length=50)


class Municipio (models.Model):
    nome = models.CharField(max_length=50)
    estado = models.ForeignKey(Estado)

class Endereco (models.Model):
    logradouro = models.CharField(max_length=255)
    municipio = models.ForeignKey(Municipio)
    CEP = models.CharField(max_length=15)
    data_cadastro = models.DateField(default=timezone.now)
    pessoa = models.ForeignKey(Pessoa)

