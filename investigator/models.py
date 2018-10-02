from __future__ import unicode_literals

from django.db import models
from datetime import datetime
from django.conf import settings
from django.contrib.auth.models import User
from django.utils.text import slugify

class Investigator(models.Model):
    names = models.CharField(max_length = 50, null = False)
    surnames = models.CharField(max_length = 50, null = False)
    birthdate = models.DateField(null = False)
    email = models.EmailField(null = False)
    slug = models.CharField(max_length=100, unique=True)
    phone = models.CharField(max_length = 30, null = False)
    address = models.CharField(max_length = 300, null = False)
    workDepartment = models.CharField(max_length = 100, null = False)
    academicTitle = models.CharField(max_length = 100, null = False)
    photo = models.FileField(upload_to='investigator/', blank=True, null=True)
    active = models.BooleanField(default = 1)
    presentation = models.TextField(null = False)
    userId = models.ForeignKey(User, on_delete=models.CASCADE)

    class Meta():
        db_table = "investigator"

    def save(self, *args, **kwargs):
        self.slug = slugify(self.names) + "_" + slugify(self.surnames)
        return super(Investigator, self).save(*args, **kwargs)
