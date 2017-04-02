from __future__ import unicode_literals

from django.db import models
from core.models import *
from app_pessoa.models import *

class Aluno (models.Model):
    matricula = models.CharField(max_length=255)
    curso = models.ForeignKey(Curso)
    pessoa = models.ForeignKey(Pessoa)
    coeficiente_rendimento = models.FloatField(blank=True, null=True, )
    coeficiente_progressao = models.FloatField(blank=True, null=True, )
    nota_selecao = models.FloatField(blank=True, null=True, )
    bolsa_escola = models.BooleanField(default=False)


class Situacao_Aluno(models.Model):
    aluno = models.ForeignKey(Aluno)
    situacao = models.ForeignKey(Situacao)
    periodo = models.ForeignKey(Periodo)

class Desempenho(models.Model):
    aluno = models.ForeignKey(Aluno)
    situacao = models.ForeignKey(Situacao)
    periodo = models.ForeignKey(Periodo)
    disciplina = models.ForeignKey(Disciplina)
    nota = models.FloatField(blank=True, null=True, )
    percentual_presenca = models.FloatField(blank=True, null=True, )
    numero_faltas = models.IntegerField(blank=True, null=True, )
    periodo_curso = models.IntegerField(blank=True, null=True, )
