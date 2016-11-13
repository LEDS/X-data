# -*- coding: utf-8 -*-
# Generated by Django 1.10.2 on 2016-11-10 14:17
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='aluno',
            name='data_conclusao',
        ),
        migrations.RemoveField(
            model_name='situacao_aluno',
            name='data_registro',
        ),
        migrations.RemoveField(
            model_name='situacao_aluno',
            name='periodo',
        ),
        migrations.AddField(
            model_name='aluno',
            name='matricula',
            field=models.CharField(default=1, max_length=255),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='situacao_aluno',
            name='data_conclusao',
            field=models.DateField(blank=True, null=True),
        ),
    ]