# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2016-05-03 14:09
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('investigator', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='investigator',
            name='fotoPerfil',
        ),
    ]