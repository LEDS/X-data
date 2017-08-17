# -*- coding: utf-8 -*-
# Generated by Django 1.10.2 on 2017-04-02 21:32
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('app_organizacional', '0001_initial'),
        ('app_pessoa', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Aluno',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('matricula', models.CharField(max_length=255)),
                ('coeficiente_rendimento', models.FloatField(blank=True, null=True)),
                ('coeficiente_progressao', models.FloatField(blank=True, null=True)),
                ('nota_selecao', models.FloatField(blank=True, null=True)),
                ('bolsa_escola', models.BooleanField(default=False)),
                ('curso', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app_organizacional.Curso')),
                ('pessoa', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app_pessoa.Pessoa')),
            ],
            options={
                'db_table': 'Aluno',
            },
        ),
        migrations.CreateModel(
            name='Desempenho',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nota', models.FloatField(blank=True, null=True)),
                ('percentual_presenca', models.FloatField(blank=True, null=True)),
                ('numero_faltas', models.IntegerField(blank=True, null=True)),
                ('periodo_curso', models.IntegerField(blank=True, null=True)),
                ('aluno', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app_aluno.Aluno')),
                ('disciplina', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app_organizacional.Disciplina')),
                ('periodo', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app_organizacional.Periodo')),
                ('situacao', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app_organizacional.Situacao')),
            ],
            options={
                'db_table': 'Desempenho',
            },
        ),
        migrations.CreateModel(
            name='Situacao_Aluno',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('aluno', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app_aluno.Aluno')),
                ('periodo', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app_organizacional.Periodo')),
                ('situacao', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app_organizacional.Situacao')),
            ],
            options={
                'db_table': 'Situacao_Aluno',
            },
        ),
    ]
