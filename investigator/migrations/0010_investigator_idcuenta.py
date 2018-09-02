# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-06-10 03:14
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('investigator', '0009_auto_20160515_2124'),
    ]

    operations = [
        migrations.AddField(
            model_name='investigator',
            name='idCuenta',
            field=models.OneToOneField(default=1, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
            preserve_default=False,
        ),
    ]
