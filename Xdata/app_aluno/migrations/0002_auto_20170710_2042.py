# -*- coding: utf-8 -*-
# Generated by Django 1.10.2 on 2017-07-10 20:42
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app_aluno', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelTable(
            name='aluno',
            table='aluno',
        ),
        migrations.AlterModelTable(
            name='desempenho',
            table='desempenho',
        ),
        migrations.AlterModelTable(
            name='situacao_aluno',
            table='situacao_aluno',
        ),
    ]
