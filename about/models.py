# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models

class About(models.Model):
    mission = models.TextField(null=True, blank=True)
    vission = models.TextField(null=True, blank=True)
    history = models.TextField(null=True, blank=True)
    email = models.TextField(null=True, blank=True)
    phone = models.TextField(null=True, blank=True)
    address = models.TextField(null=True, blank=True)
    introductoryText = models.TextField(null=True, blank=True)
    introductoryImage = models.FileField(upload_to='about/', blank=True, null=True)

    class Meta():
        db_table = 'about'
