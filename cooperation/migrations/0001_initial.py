# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2016-07-03 17:00
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('blog', '0004_auto_20160617_1544'),
    ]

    operations = [
        migrations.CreateModel(
            name='Cooperation',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, unique=True)),
                ('description', models.TextField()),
                ('created_at', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='ModulesCooperation',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, unique=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('articles', models.ManyToManyField(related_name='article_modulescooperation', to='blog.Article')),
                ('master', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='Cooperation_modules', to='cooperation.Cooperation')),
            ],
        ),
    ]