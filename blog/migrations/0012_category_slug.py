# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2016-08-02 02:34
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0011_article_active'),
    ]

    operations = [
        migrations.AddField(
            model_name='category',
            name='slug',
            field=models.CharField(max_length=255, null=True, unique=True),
        ),
    ]