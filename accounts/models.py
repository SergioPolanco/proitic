# -*- coding: utf-8 -*-
# encoding=utf8
from __future__ import unicode_literals
from django.db import models
from django.conf import settings
from django.db.models.signals import pre_delete
from django.dispatch.dispatcher import receiver

class UserProfile(models.Model):
    user = models.OneToOneField(settings.AUTH_USER_MODEL)
    photo = models.FileField(upload_to='profiles/', blank=True, null=True)

    def __str__(self):
        return self.user.username
