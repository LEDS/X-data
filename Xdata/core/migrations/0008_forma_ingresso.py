# -*- coding: utf-8 -*-
# Generated by Django 1.10.2 on 2016-12-07 17:28
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0007_auto_20161201_1459'),
    ]

    operations = [
        migrations.CreateModel(
            name='Forma_Ingresso',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(max_length=100)),
                ('sigla', models.CharField(max_length=25)),
            ],
        ),
    ]