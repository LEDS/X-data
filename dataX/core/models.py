from __future__ import unicode_literals

from django.db import models

# Create your models here.

class Aluno (models.Model):
    data_matricula = models.DateField()
    data_conclusao = models.DateField()

class Cor (models.Model):
    nome = models.CharField(max_length=50)

class Sexo (models.Model):
    sexo = models.CharField(max_length=50, default="Não Informado")

class Pessoa (models.Model):
    data_nascimento = models.DateField()
    data_conclusao_ensino_medio = models.DateField()
    cor = models.OneToOneField(Cor)
    sexo = models.OneToOneField(Sexo)
    CEP = models.CharField(max_length=15)
    matriculas = models.ForeignKey(Aluno)


