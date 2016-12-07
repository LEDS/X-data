from django.db import models
from django.utils import timezone


class Campus (models.Model):
    nome = models.CharField(max_length=50)

class Departamento(models.Model):
    nome = models.CharField(max_length=255)
    campus = models.ForeignKey(Campus)

class Curso (models.Model):
    nome = models.CharField(max_length=255)
    sigla = models.CharField(max_length=50)
    departamentos = models.ForeignKey(Departamento, blank=True, null=True,)

class Cor (models.Model):
    nome = models.CharField(max_length=50)
    sigla = models.CharField(max_length=3)

class Sexo (models.Model):
    nome = models.CharField(max_length=50)
    sigla = models.CharField(max_length=1)

class Periodo(models.Model):
    ano = models.IntegerField()
    semestre = models.IntegerField()

class Renda_Familiar(models.Model):
    descricao = models.CharField(max_length=50)
    codigo  = models.IntegerField()

class Tipo_Escola_Origem(models.Model):
    descricao = models.CharField(max_length=50)
    codigo = models.CharField(max_length=1)

class Situacao (models.Model):
    nome = models.CharField(max_length=50)

class Forma_Ingresso(models.Model):
    nome = models.CharField(max_length=100)
    sigla = models.CharField(max_length=25)

class Pessoa(models.Model):
    ano_nascimento = models.IntegerField(blank=True,null=True,)
    ano_conclusao_ensino_medio = models.IntegerField(blank=True,null=True,)
    codigo_social = models.CharField(max_length=255)
    cor = models.ForeignKey(Cor)
    sexo = models.ForeignKey(Sexo)

class Aluno (models.Model):
    matricula = models.CharField(max_length=255)
    curso = models.ForeignKey(Curso)
    pessoa = models.ForeignKey(Pessoa)

class Situacao_Aluno(models.Model):
    aluno = models.ForeignKey(Aluno)
    situacao = models.ForeignKey(Situacao)
    data_registro = models.DateField(blank=True, null=True, )
    periodo = models.ForeignKey(Periodo)

class Endereco (models.Model):
    CEP = models.CharField(max_length=15,blank=True,null=True,)
    data_cadastro = models.DateField(default=timezone.now)
    pessoa = models.ForeignKey(Pessoa)

