from django.db import models

class Campus (models.Model):
    nome = models.CharField(max_length=50)

class Departamento(models.Model):
    nome = models.CharField(max_length=255)
    campus = models.ForeignKey(Campus)

class Curso (models.Model):
    nome = models.CharField(max_length=255)
    sigla = models.CharField(max_length=50)
    departamentos = models.ForeignKey(Departamento, blank=True, null=True,)

class Disciplina (models.Model):
    nome = models.CharField(max_length=255)
    code = models.CharField(max_length=10)
    curso = models.ForeignKey(Curso, blank=True, null=True,)

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
    nome = models.CharField(max_length=400)
    sigla = models.CharField(max_length=50)

class Pessoa(models.Model):
    ano_nascimento = models.IntegerField(blank=True,null=True,)
    ano_conclusao_ensino_medio = models.IntegerField(blank=True,null=True,)
    codigo_social = models.CharField(max_length=255)
    ano_reservista = models.IntegerField(blank=True, null=True, )
    cor = models.ForeignKey(Cor)
    sexo = models.ForeignKey(Sexo)

class Escola_Origem_Pessoa(models.Model):
    pessoa = models.ForeignKey(Pessoa)
    tipo_escola_origem = models.ForeignKey(Tipo_Escola_Origem)
    ano = models.IntegerField(blank=True, null=True,)

class Renda_Familiar_Pessoa(models.Model):
    pessoa = models.ForeignKey(Pessoa)
    renda_familiar = models.ForeignKey(Renda_Familiar)
    ano = models.IntegerField(blank=True, null=True,)

class Forma_Ingresso_Pessoa(models.Model):
    pessoa = models.ForeignKey(Pessoa)
    forma_ingresso = models.ForeignKey(Forma_Ingresso)
    ano = models.IntegerField(blank=True, null=True, )

class Aluno (models.Model):
    matricula = models.CharField(max_length=255)
    curso = models.ForeignKey(Curso)
    pessoa = models.ForeignKey(Pessoa)

class Situacao_Aluno(models.Model):
    aluno = models.ForeignKey(Aluno)
    situacao = models.ForeignKey(Situacao)
    periodo = models.ForeignKey(Periodo)

class Desempenho(models.Model):
    aluno = models.ForeignKey(Aluno)
    situacao = models.ForeignKey(Situacao)
    periodo = models.ForeignKey(Periodo)
    disciplina = models.ForeignKey(Disciplina)
    nota = models.FloatField()
    percentual_presenca = models.FloatField()
    numero_faltas = models.IntegerField()    

class Endereco (models.Model):
    cep = models.CharField(max_length=50,blank=True,null=True,)
    pessoa = models.ForeignKey(Pessoa)
