# -*- coding: utf-8 -*-
# Generated by Django 1.10.2 on 2017-07-10 20:42
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app_organizacional', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelTable(
            name='campus',
            table='campus',
        ),
        migrations.AlterModelTable(
            name='curso',
            table='curso',
        ),
        migrations.AlterModelTable(
            name='departamento',
            table='departamento',
        ),
        migrations.AlterModelTable(
            name='disciplina',
            table='disciplina',
        ),
        migrations.AlterModelTable(
            name='periodo',
            table='periodo',
        ),
        migrations.AlterModelTable(
            name='situacao',
            table='situacao',
        ),
    ]
