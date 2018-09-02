# -*- coding: utf-8 -*-
# Generated by Django 1.11.10 on 2018-02-06 03:37
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='About',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('mission', models.TextField(blank=True, null=True)),
                ('vission', models.TextField(blank=True, null=True)),
                ('history', models.TextField(blank=True, null=True)),
                ('email', models.TextField(blank=True, null=True)),
                ('phone', models.TextField(blank=True, null=True)),
                ('address', models.TextField(blank=True, null=True)),
            ],
            options={
                'db_table': 'about',
            },
        ),
    ]
