# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-04-23 22:15
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('investigator', '0016_auto_20160909_2131'),
    ]

    operations = [
        migrations.AlterField(
            model_name='investigator',
            name='presentacion',
            field=models.TextField(),
        ),
    ]
