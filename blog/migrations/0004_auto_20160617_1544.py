# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2016-06-17 21:44
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0003_auto_20160617_1018'),
    ]

    operations = [
        migrations.AlterField(
            model_name='article',
            name='slug',
            field=models.CharField(max_length=100, unique=True),
        ),
    ]
