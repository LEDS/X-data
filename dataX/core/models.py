from __future__ import unicode_literals

from django.db import models

# Create your models here.


class Estrutura(models.Model):
    nome = models.CharField(max_length=50, blank=True,
                            null=True,)

class Matriz_Curricular(models.Model):
    nome = models.CharField(max_length=50, blank=True,
                            null=True,
                            )
    estrutura = models.ForeignKey(Estrutura, blank=True,
                                  null=True,
                                  )

class Curso (models.Model):
    nome = models.CharField(max_length=50, blank=True,
                            null=True,
                            )
    matrizes_curriculares = models.ForeignKey(Matriz_Curricular, blank=True,
                                              null=True,

                                              )

class Departamento(models.Model):
    nome = models.CharField(max_length=50, blank=True,
                            null=True,)
    cursos = models.ForeignKey(Curso, blank=True,
                               null=True,)

class Campus (models.Model):
    nome = models.CharField(max_length=50, blank=True,
                            null=True,)
    departamentos = models.ForeignKey(Departamento, blank=True,
                                      null=True,)

class Periodo (models.Model):
     ano = models.IntegerField()
     semestre = models.IntegerField()

class Disciplina (models.Model):
    nome = models.CharField(max_length=50, blank=True,
                            null=True,)

class Historico (models.Model):

    APROVADO = 'AP'
    REPROVADO_NOTA = 'RN'
    REPROVADO_FALTA = 'RF'

    STATUS_ALUNO = (
        (APROVADO, 'APROVADO'),
        (REPROVADO_NOTA, 'REPROVADO_NOTA'),
        (REPROVADO_FALTA, 'REPROVADO_FALTA'),
    )
    status = models.CharField(
        max_length=2,
        choices=STATUS_ALUNO,
        default=APROVADO,
    )


    Disciplina = models.ForeignKey(Disciplina, blank=True,
                                   null=True,)
    nota = models.IntegerField()
    periodo = models.ForeignKey(Periodo, blank=True,
                                null=True,
                                )

class Aluno (models.Model):
    data_matricula = models.DateField()
    data_conclusao = models.DateField()
    Historico = models.ForeignKey(Historico)
    matriz_curricular = models.ForeignKey(Matriz_Curricular)


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
    cor = models.ForeignKey(Cor)
    sexo = models.ForeignKey(Sexo)
    CEP = models.CharField(max_length=15)
    matriculas = models.ForeignKey(Aluno)
    endereco = models.ForeignKey(Endereco)


