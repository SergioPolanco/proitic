# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2016-09-10 03:30
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('investigator', '0013_auto_20160909_2128'),
    ]

    operations = [
        migrations.AddField(
            model_name='investigator_social',
            name='profile_social',
            field=models.TextField(null=True),
        ),
    ]
