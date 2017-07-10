from __future__ import unicode_literals

from django.db import models

class Campus (models.Model):
    nome = models.CharField(max_length=50)
    class Meta:
        db_table = 'campus'

class Departamento(models.Model):
    nome = models.CharField(max_length=255)
    campus = models.ForeignKey(Campus)
    class Meta:
        db_table = 'departamento'

class Curso (models.Model):
    nome = models.CharField(max_length=255)
    sigla = models.CharField(max_length=50)
    departamentos = models.ForeignKey(Departamento, blank=True, null=True,)
    class Meta:
        db_table = 'curso'

class Disciplina (models.Model):
    nome = models.CharField(max_length=255)
    code = models.CharField(max_length=10)
    curso = models.ForeignKey(Curso, blank=True, null=True,)
    class Meta:
        db_table = 'disciplina'

class Periodo(models.Model):
    ano = models.IntegerField()
    semestre = models.IntegerField()
    class Meta:
        db_table = 'periodo'

class Situacao (models.Model):
    nome = models.CharField(max_length=50)
    class Meta:
        db_table = 'situacao'
