from __future__ import unicode_literals

from django.db import models

# Create your models here.


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


class Aluno (models.Model):
    data_matricula = models.DateField()
    data_conclusao = models.DateField()
    matriz_curricular = models.ForeignKey(Matriz_Curricular)


class Cor (models.Model):
    nome = models.CharField(max_length=50)

class Sexo (models.Model):
    sexo = models.CharField(max_length=50)

class Pessoa (models.Model):
    data_nascimento = models.DateField()
    data_conclusao_ensino_medio = models.DateField()
    cor = models.ForeignKey(Cor)
    sexo = models.ForeignKey(Sexo)
    CEP = models.CharField(max_length=15)
    matriculas = models.ForeignKey(Aluno)


